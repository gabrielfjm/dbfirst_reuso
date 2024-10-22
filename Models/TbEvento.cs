using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbEvento
{
    public long Id { get; set; }

    public DateOnly? Data { get; set; }

    public string? Descricao { get; set; }

    public TimeOnly? Horario { get; set; }

    public long? TipoEventoId { get; set; }

    public virtual ICollection<TbIngresso> TbIngressos { get; set; } = new List<TbIngresso>();

    public virtual TbTipoEvento? TipoEvento { get; set; }
}
