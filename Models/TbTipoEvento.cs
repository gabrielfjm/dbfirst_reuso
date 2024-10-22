using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbTipoEvento
{
    public long Id { get; set; }

    public string? Descricao { get; set; }

    public virtual ICollection<TbEvento> TbEventos { get; set; } = new List<TbEvento>();
}
