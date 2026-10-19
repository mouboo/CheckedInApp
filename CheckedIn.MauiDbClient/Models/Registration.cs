using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CheckedIn.MauiDbClient;

[Table("Registration")]
public class Registration
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column("RegistrationId")]

    public int RegistrationId { get; set;}

    [Column("PersonId")]
    public int PersonId { get; set;}

    [Column("EventId")]
    public int EventId { get; set;}

    [Column("RegistrationStatus")]
    [MaxLength(100)]
    public string? RegistrationStatus { get; private set; } = "NotCheckedIn";


    [ForeignKey("PersonId")]
    public virtual Person Person { get; set;} = null!;

    [ForeignKey("EventId")]
    public virtual Event Event { get; set;} = null!;
 

}
