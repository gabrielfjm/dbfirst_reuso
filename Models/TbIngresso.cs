using System;
using System.Collections.Generic;

namespace EfCoreDbFirst.Models;

public partial class TbIngresso
{
    public long Id { get; set; }

    public string? Descricao { get; set; }

    public byte[] Inteiro { get; set; } = null!;

    public int Quantidade { get; set; }

    public string? Titulo { get; set; }

    public float Valor { get; set; }

    public long? AnuncioId { get; set; }

    public long? EventoId { get; set; }

    public long? PfIId { get; set; }

    public long? PjIId { get; set; }

    public virtual TbAnuncio? Anuncio { get; set; }

    public virtual TbEvento? Evento { get; set; }

    public virtual TbPessoaFisica? PfI { get; set; }

    public virtual TbPessoaJuridica? PjI { get; set; }
}
