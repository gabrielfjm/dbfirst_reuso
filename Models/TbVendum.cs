using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbVendum
{
    public long Id { get; set; }

    public long? AnuncioId { get; set; }

    public long? EstadoVendaId { get; set; }

    public long? PfVId { get; set; }

    public long? PjVId { get; set; }

    public virtual TbAnuncio? Anuncio { get; set; }

    public virtual EstadoVendaBase? EstadoVenda { get; set; }

    public virtual TbPessoaFisica? PfV { get; set; }

    public virtual TbPessoaJuridica? PjV { get; set; }
}
