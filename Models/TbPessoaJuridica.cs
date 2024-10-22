using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbPessoaJuridica
{
    public long Id { get; set; }

    public string? Email { get; set; }

    public string? Senha { get; set; }

    public string? Cnpj { get; set; }

    public string? Fantasia { get; set; }

    public virtual ICollection<TbAnuncio> TbAnuncios { get; set; } = new List<TbAnuncio>();

    public virtual ICollection<TbIngresso> TbIngressos { get; set; } = new List<TbIngresso>();

    public virtual ICollection<TbTelefone> TbTelefones { get; set; } = new List<TbTelefone>();

    public virtual ICollection<TbVendum> TbVenda { get; set; } = new List<TbVendum>();
}
