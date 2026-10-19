using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CheckedIn.MauiDbClient;

[Table("Coordinator")]
public class Coordinator
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column("CoordinatorId")]

    public int CoordinatorId { get; set;}

    [Column("PersonId")]
    public int PersonId { get; set;}

    [ForeignKey("PersonId")]
    public virtual Person Person { get; set;} = null!;

}
