using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class EstadoVendaBase
{
    public string TipoEstadoVenda { get; set; } = null!;

    public long Id { get; set; }

    public virtual ICollection<TbVendum> TbVenda { get; set; } = new List<TbVendum>();
}
