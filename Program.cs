using EfCoreDbFirst.Models;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Configurar a string de conexão (usando appsettings.json ou diretamente aqui)
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");

// Adicionar o serviço do DbContext no contêiner de serviços usando SQL Server
builder.Services.AddDbContext<ReusoDbFirstContext>(options =>
    options.UseSqlServer(connectionString));

// Adicionar serviços ao contêiner
builder.Services.AddControllers();

// Configurar o Swagger/OpenAPI
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configurar o pipeline de requisição HTTP
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
