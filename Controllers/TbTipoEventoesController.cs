using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using EfCoreDbFirst.Models;

namespace EfCoreDbFirst.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TbTipoEventoesController : ControllerBase
    {
        private readonly ReusoDbFirstContext _context;

        public TbTipoEventoesController(ReusoDbFirstContext context)
        {
            _context = context;
        }

        // GET: api/TbTipoEventoes
        [HttpGet]
        public async Task<ActionResult<IEnumerable<TbTipoEvento>>> GetTbTipoEventos()
        {
            return await _context.TbTipoEventos.ToListAsync();
        }

        // GET: api/TbTipoEventoes/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TbTipoEvento>> GetTbTipoEvento(long id)
        {
            var tbTipoEvento = await _context.TbTipoEventos.FindAsync(id);

            if (tbTipoEvento == null)
            {
                return NotFound();
            }

            return tbTipoEvento;
        }

        // PUT: api/TbTipoEventoes/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutTbTipoEvento(long id, TbTipoEvento tbTipoEvento)
        {
            if (id != tbTipoEvento.Id)
            {
                return BadRequest();
            }

            _context.Entry(tbTipoEvento).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!TbTipoEventoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/TbTipoEventoes
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<TbTipoEvento>> PostTbTipoEvento(TbTipoEvento tbTipoEvento)
        {
            _context.TbTipoEventos.Add(tbTipoEvento);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetTbTipoEvento", new { id = tbTipoEvento.Id }, tbTipoEvento);
        }

        // DELETE: api/TbTipoEventoes/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteTbTipoEvento(long id)
        {
            var tbTipoEvento = await _context.TbTipoEventos.FindAsync(id);
            if (tbTipoEvento == null)
            {
                return NotFound();
            }

            _context.TbTipoEventos.Remove(tbTipoEvento);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool TbTipoEventoExists(long id)
        {
            return _context.TbTipoEventos.Any(e => e.Id == id);
        }
    }
}
