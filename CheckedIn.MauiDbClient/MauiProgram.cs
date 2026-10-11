using System.Reflection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
namespace CheckedIn.MauDbClient;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
			});
		// Reads in appsettings.json file for EFCore to get connection
		var assembly = Assembly.GetExecutingAssembly();
		string appsettingsFileName = "CheckedIn.MauiDbClient.appsettings.json";
		using (var stream = assembly.GetManifestResourceStream(appsettingsFileName))
		{
			if (stream != null)
			{
				builder.Configuration.AddJsonStream(stream);
			}
		}

#if DEBUG
		builder.Logging.AddDebug();
#endif

		return builder.Build();
	}
}
