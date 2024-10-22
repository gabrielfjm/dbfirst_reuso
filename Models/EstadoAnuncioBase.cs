using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class EstadoAnuncioBase
{
    public string TipoEstadoAnuncio { get; set; } = null!;

    public long Id { get; set; }

    public virtual ICollection<TbAnuncio> TbAnuncios { get; set; } = new List<TbAnuncio>();
}
