using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EfCoreDbFirst.Models;

public partial class ReusoDbFirstContext : DbContext
{
    public ReusoDbFirstContext()
    {
    }

    public ReusoDbFirstContext(DbContextOptions<ReusoDbFirstContext> options)
        : base(options)
    {
    }

    public virtual DbSet<EstadoAnuncioBase> EstadoAnuncioBases { get; set; }

    public virtual DbSet<EstadoVendaBase> EstadoVendaBases { get; set; }

    public virtual DbSet<TbAnuncio> TbAnuncios { get; set; }

    public virtual DbSet<TbEvento> TbEventos { get; set; }

    public virtual DbSet<TbIngresso> TbIngressos { get; set; }

    public virtual DbSet<TbPessoaFisica> TbPessoaFisicas { get; set; }

    public virtual DbSet<TbPessoaJuridica> TbPessoaJuridicas { get; set; }

    public virtual DbSet<TbTelefone> TbTelefones { get; set; }

    public virtual DbSet<TbTipoEvento> TbTipoEventos { get; set; }

    public virtual DbSet<TbVendum> TbVenda { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost;Database=reusoDbFirst;Trusted_Connection=True;TrustServerCertificate=True;");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<EstadoAnuncioBase>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_estado_anuncio_base_id");

            entity.ToTable("estado_anuncio_base", "reuso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.TipoEstadoAnuncio)
                .HasMaxLength(31)
                .HasColumnName("tipo_estado_anuncio");
        });

        modelBuilder.Entity<EstadoVendaBase>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_estado_venda_base_id");

            entity.ToTable("estado_venda_base", "reuso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.TipoEstadoVenda)
                .HasMaxLength(31)
                .HasColumnName("tipo_estado_venda");
        });

        modelBuilder.Entity<TbAnuncio>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_anuncio_id");

            entity.ToTable("tb_anuncio", "reuso");

            entity.HasIndex(e => e.PjAId, "FK5y9hef04ntxsgpi3mf5o5lw4b");

            entity.HasIndex(e => e.EstadoAnuncioId, "FKdn03rmffuvm411rfer3c2fc49");

            entity.HasIndex(e => e.PfAId, "FKofc513vl3f57vk2j0n10bn2i9");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Descricao)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("descricao");
            entity.Property(e => e.EstadoAnuncioId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("estado_anuncio_id");
            entity.Property(e => e.PfAId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pf_a_id");
            entity.Property(e => e.PjAId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pj_a_id");
            entity.Property(e => e.Titulo)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("titulo");

            entity.HasOne(d => d.EstadoAnuncio).WithMany(p => p.TbAnuncios)
                .HasForeignKey(d => d.EstadoAnuncioId)
                .HasConstraintName("tb_anuncio$FKdn03rmffuvm411rfer3c2fc49");

            entity.HasOne(d => d.PfA).WithMany(p => p.TbAnuncios)
                .HasForeignKey(d => d.PfAId)
                .HasConstraintName("tb_anuncio$FKofc513vl3f57vk2j0n10bn2i9");

            entity.HasOne(d => d.PjA).WithMany(p => p.TbAnuncios)
                .HasForeignKey(d => d.PjAId)
                .HasConstraintName("tb_anuncio$FK5y9hef04ntxsgpi3mf5o5lw4b");
        });

        modelBuilder.Entity<TbEvento>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_evento_id");

            entity.ToTable("tb_evento", "reuso");

            entity.HasIndex(e => e.TipoEventoId, "FKm34l73e4301nedj8xmwbf97mj");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Data)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("data");
            entity.Property(e => e.Descricao)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("descricao");
            entity.Property(e => e.Horario)
                .HasPrecision(6)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("horario");
            entity.Property(e => e.TipoEventoId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("tipo_evento_id");

            entity.HasOne(d => d.TipoEvento).WithMany(p => p.TbEventos)
                .HasForeignKey(d => d.TipoEventoId)
                .HasConstraintName("tb_evento$FKm34l73e4301nedj8xmwbf97mj");
        });

        modelBuilder.Entity<TbIngresso>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_ingresso_id");

            entity.ToTable("tb_ingresso", "reuso");

            entity.HasIndex(e => e.EventoId, "FK2i610oxfrhcmbkveb1qjoym0t");

            entity.HasIndex(e => e.AnuncioId, "FK3b5ru7fjad4up8xr5wx6v3y6r");

            entity.HasIndex(e => e.PfIId, "FK3lhl6uudmrxy2ubp1l43c1lso");

            entity.HasIndex(e => e.PjIId, "FKa1asystgecdcqe9jtjf6y1hw1");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AnuncioId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("anuncio_id");
            entity.Property(e => e.Descricao)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("descricao");
            entity.Property(e => e.EventoId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("evento_id");
            entity.Property(e => e.Inteiro)
                .HasMaxLength(1)
                .IsFixedLength()
                .HasColumnName("inteiro");
            entity.Property(e => e.PfIId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pf_i_id");
            entity.Property(e => e.PjIId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pj_i_id");
            entity.Property(e => e.Quantidade).HasColumnName("quantidade");
            entity.Property(e => e.Titulo)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("titulo");
            entity.Property(e => e.Valor).HasColumnName("valor");

            entity.HasOne(d => d.Anuncio).WithMany(p => p.TbIngressos)
                .HasForeignKey(d => d.AnuncioId)
                .HasConstraintName("tb_ingresso$FK3b5ru7fjad4up8xr5wx6v3y6r");

            entity.HasOne(d => d.Evento).WithMany(p => p.TbIngressos)
                .HasForeignKey(d => d.EventoId)
                .HasConstraintName("tb_ingresso$FK2i610oxfrhcmbkveb1qjoym0t");

            entity.HasOne(d => d.PfI).WithMany(p => p.TbIngressos)
                .HasForeignKey(d => d.PfIId)
                .HasConstraintName("tb_ingresso$FK3lhl6uudmrxy2ubp1l43c1lso");

            entity.HasOne(d => d.PjI).WithMany(p => p.TbIngressos)
                .HasForeignKey(d => d.PjIId)
                .HasConstraintName("tb_ingresso$FKa1asystgecdcqe9jtjf6y1hw1");
        });

        modelBuilder.Entity<TbPessoaFisica>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_pessoa_fisica_id");

            entity.ToTable("tb_pessoa_fisica", "reuso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Cpf)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("cpf");
            entity.Property(e => e.DataNascimento)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("data_nascimento");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("email");
            entity.Property(e => e.NomeCompleto)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("nome_completo");
            entity.Property(e => e.Senha)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("senha");
        });

        modelBuilder.Entity<TbPessoaJuridica>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_pessoa_juridica_id");

            entity.ToTable("tb_pessoa_juridica", "reuso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Cnpj)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("cnpj");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("email");
            entity.Property(e => e.Fantasia)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("fantasia");
            entity.Property(e => e.Senha)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("senha");
        });

        modelBuilder.Entity<TbTelefone>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_telefone_id");

            entity.ToTable("tb_telefone", "reuso");

            entity.HasIndex(e => e.PfTId, "FKelpxi3jcvulvb8vfpsxhf8rhn");

            entity.HasIndex(e => e.PjTId, "FKp255ldtv0cbwphvxw21uk27nv");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Ddd)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("ddd");
            entity.Property(e => e.Ddi)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("ddi");
            entity.Property(e => e.Numero)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("numero");
            entity.Property(e => e.PfTId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pf_t_id");
            entity.Property(e => e.PjTId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pj_t_id");

            entity.HasOne(d => d.PfT).WithMany(p => p.TbTelefones)
                .HasForeignKey(d => d.PfTId)
                .HasConstraintName("tb_telefone$FKelpxi3jcvulvb8vfpsxhf8rhn");

            entity.HasOne(d => d.PjT).WithMany(p => p.TbTelefones)
                .HasForeignKey(d => d.PjTId)
                .HasConstraintName("tb_telefone$FKp255ldtv0cbwphvxw21uk27nv");
        });

        modelBuilder.Entity<TbTipoEvento>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_tipo_evento_id");

            entity.ToTable("tb_tipo_evento", "reuso");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Descricao)
                .HasMaxLength(255)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("descricao");
        });

        modelBuilder.Entity<TbVendum>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK_tb_venda_id");

            entity.ToTable("tb_venda", "reuso");

            entity.HasIndex(e => e.EstadoVendaId, "FKf78kauqgo8agebqxcgvdxq31s");

            entity.HasIndex(e => e.PfVId, "FKhss4uig6h02jy87kew7kgltqk");

            entity.HasIndex(e => e.PjVId, "FKjlitfff4rqhuw1ap22vqgon3m");

            entity.HasIndex(e => e.AnuncioId, "FKo7udal8yipfaugrtfwgyujuig");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AnuncioId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("anuncio_id");
            entity.Property(e => e.EstadoVendaId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("estado_venda_id");
            entity.Property(e => e.PfVId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pf_v_id");
            entity.Property(e => e.PjVId)
                .HasDefaultValueSql("(NULL)")
                .HasColumnName("pj_v_id");

            entity.HasOne(d => d.Anuncio).WithMany(p => p.TbVenda)
                .HasForeignKey(d => d.AnuncioId)
                .HasConstraintName("tb_venda$FKo7udal8yipfaugrtfwgyujuig");

            entity.HasOne(d => d.EstadoVenda).WithMany(p => p.TbVenda)
                .HasForeignKey(d => d.EstadoVendaId)
                .HasConstraintName("tb_venda$FKf78kauqgo8agebqxcgvdxq31s");

            entity.HasOne(d => d.PfV).WithMany(p => p.TbVenda)
                .HasForeignKey(d => d.PfVId)
                .HasConstraintName("tb_venda$FKhss4uig6h02jy87kew7kgltqk");

            entity.HasOne(d => d.PjV).WithMany(p => p.TbVenda)
                .HasForeignKey(d => d.PjVId)
                .HasConstraintName("tb_venda$FKjlitfff4rqhuw1ap22vqgon3m");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
