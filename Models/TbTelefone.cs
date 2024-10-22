using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbTelefone
{
    public long Id { get; set; }

    public string? Ddd { get; set; }

    public string? Ddi { get; set; }

    public string? Numero { get; set; }

    public long? PfTId { get; set; }

    public long? PjTId { get; set; }

    public virtual TbPessoaFisica? PfT { get; set; }

    public virtual TbPessoaJuridica? PjT { get; set; }
}
