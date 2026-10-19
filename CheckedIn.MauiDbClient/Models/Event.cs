using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace CheckedIn.MauiDbClient;

[Table("Event")]
public class Event
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    [Column("EventId")]

    public int EventId { get; set;}

    [Required]
    [Column("EventName")]
    [MaxLength(100)]

    public required string EventName { get; set;}

    [Required]
    [Column("EventTime")]

    public required DateTime EventTime { get; set;}

    [Required]
    [Column("EventPlace")]
    [MaxLength (100)]

    public required string EventPlace { get; set;}

}
