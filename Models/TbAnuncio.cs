using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbAnuncio
{
    public long Id { get; set; }

    public string? Descricao { get; set; }

    public string? Titulo { get; set; }

    public long? EstadoAnuncioId { get; set; }

    public long? PfAId { get; set; }

    public long? PjAId { get; set; }

    public virtual EstadoAnuncioBase? EstadoAnuncio { get; set; }

    public virtual TbPessoaFisica? PfA { get; set; }

    public virtual TbPessoaJuridica? PjA { get; set; }

    public virtual ICollection<TbIngresso> TbIngressos { get; set; } = new List<TbIngresso>();

    public virtual ICollection<TbVendum> TbVenda { get; set; } = new List<TbVendum>();
}
