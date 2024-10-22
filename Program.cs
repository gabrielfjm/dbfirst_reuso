using EfCoreDbFirst.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Configurar a string de conex�o (usando appsettings.json ou diretamente aqui)
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Adicionar o servi�o do DbContext no cont�iner de servi�os usando SQL Server
builder.Services.AddDbContext<ReusoDbFirstContext>(options =>
    options.UseSqlServer(connectionString));

// Adicionar servi�os ao cont�iner
builder.Services.AddControllers();

// Configurar o Swagger/OpenAPI
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configurar o pipeline de requisi��o HTTP
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
