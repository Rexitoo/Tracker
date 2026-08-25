@echo off
echo Creando estructura del proyecto Nuzlocke ORAS...

REM Crear archivo index.html con todo el código integrado
echo ^<!DOCTYPE html^> > index.html
echo ^<html lang="es"^> >> index.html
echo ^<head^> >> index.html
echo     ^<meta charset="UTF-8"^> >> index.html
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> index.html
echo     ^<title^>Nuzlocke Tracker - ORAS Torneo^</title^> >> index.html
echo     ^<!-- Tailwind CSS CDN --^> >> index.html
echo     ^<script src="https://cdn.tailwindcss.com"^>^</script^> >> index.html
echo ^</head^> >> index.html
echo ^<body class="bg-slate-900 text-slate-100 min-h-screen font-sans p-6"^> >> index.html
echo. >> index.html
echo     ^<div class="max-w-6xl mx-auto"^> >> index.html
echo         ^<!-- Cabecera --^> >> index.html
echo         ^<header class="text-center mb-8"^> >> index.html
echo             ^<h1 class="text-4xl font-extrabold text-red-500 tracking-wider"^>TORNEO NUZLOCKE ORAS^</h1^> >> index.html
echo             ^<p class="text-slate-400 mt-2"^>Panel de Control de Entrenadores y Gestion de Equipos^</p^> >> index.html
echo         ^</header^> >> index.html
echo. >> index.html
echo         ^<!-- Selector de Entrenador --^> >> index.html
echo         ^<div class="bg-slate-800 p-4 rounded-xl shadow-lg mb-8 flex flex-col md:flex-row justify-between items-center gap-4 border border-slate-700"^> >> index.html
echo             ^<div^> >> index.html
echo                 ^<label for="trainerSelect" class="block text-sm font-medium text-slate-300 mb-1"^>Selecciona tu perfil de Entrenador:^</label^> >> index.html
echo                 ^<select id="trainerSelect" class="bg-slate-900 border border-slate-600 rounded-lg px-4 py-2 text-white focus:outline-none focus:border-red-500"^> >> index.html
echo                     ^<!-- Se rellenara por JS (24 jugadores) --^> >> index.html
echo                 ^</select^> >> index.html
echo             ^</div^> >> index.html
echo             ^<button onclick="openAddModal()" class="bg-red-600 hover:bg-red-700 text-white font-bold px-6 py-2 rounded-lg transition duration-200 shadow-md"^> >> index.html
echo                 + Añadir Pokemon >> index.html
echo             ^</button^> >> index.html
echo         ^</div^> >> index.html
echo. >> index.html
echo         ^<!-- Secciones de Estados del Nuzlocke --^> >> index.html
echo         ^<div class="grid grid-cols-1 md:grid-cols-2 gap-6"^> >> index.html
echo             ^<!-- Equipo Activo y Caja (Vivos) --^> >> index.html
echo             ^<div class="bg-slate-800 p-5 rounded-xl border border-slate-700 shadow-md"^> >> index.html
echo                 ^<h2 class="text-xl font-bold text-emerald-400 mb-4 border-b border-slate-700 pb-2"^>🟢 Vivos (Equipo / Caja)^</h2^> >> index.html
echo                 ^<div id="list-active" class="space-y-3 min-h-[150px]"^>^</div^> >> index.html
echo             ^</div^> >> index.html
echo             ^<!-- Cementerio (Muertos) --^> >> index.html
echo             ^<div class="bg-slate-800 p-5 rounded-xl border border-slate-700 shadow-md"^> >> index.html
echo                 ^<h2 class="text-xl font-bold text-red-400 mb-4 border-b border-slate-700 pb-2"^>💀 Cementerio (Muertos)^</h2^> >> index.html
echo                 ^<div id="list-dead" class="space-y-3 min-h-[150px]"^>^</div^> >> index.html
echo             ^</div^> >> index.html
echo             ^<!-- Robados --^> >> index.html
echo             ^<div class="bg-slate-800 p-5 rounded-xl border border-slate-700 shadow-md"^> >> index.html
echo                 ^<h2 class="text-xl font-bold text-amber-400 mb-4 border-b border-slate-700 pb-2"^>🤝 Robados / Intercambiados^</h2^> >> index.html
echo                 ^<div id="list-stolen" class="space-y-3 min-h-[150px]"^>^</div^> >> index.html
echo             ^</div^> >> index.html
echo             ^<!-- Baneados --^> >> index.html
echo             ^<div class="bg-slate-800 p-5 rounded-xl border border-slate-700 shadow-md"^> >> index.html
echo                 ^<h2 class="text-xl font-bold text-purple-400 mb-4 border-b border-slate-700 pb-2"^>🚫 Baneados / Restringidos^</h2^> >> index.html
echo                 ^<div id="list-banned" class="space-y-3 min-h-[150px]"^>^</div^> >> index.html
echo             ^</div^> >> index.html
echo         ^</div^> >> index.html
echo     ^</div^> >> index.html
echo. >> index.html
echo     ^<!-- Modal para Añadir Pokemon --^> >> index.html
echo     ^<div id="pokemonModal" class="hidden fixed inset-0 bg-black/70 flex items-center justify-center p-4 z-50"^> >> index.html
echo         ^<div class="bg-slate-800 p-6 rounded-xl w-full max-w-md border border-slate-700 shadow-2xl"^> >> index.html
echo             ^<h3 class="text-2xl font-bold mb-4 text-white"^>Registrar Pokemon^</h3^> >> index.html
echo             ^<form id="pokemonForm" onsubmit="savePokemon(event)" class="space-y-4"^> >> index.html
echo                 ^<div^> >> index.html
echo                     ^<label class="block text-sm text-slate-300"^>Especie:^</label^> >> index.html
echo                     ^<input type="text" id="species" required placeholder="Ej: Blaziken, Gardevoir..." class="w-full bg-slate-900 border border-slate-700 rounded p-2 text-white mt-1"^> >> index.html
echo                 ^</div^> >> index.html
echo                 ^<div^> >> index.html
echo                     ^<label class="block text-sm text-slate-300"^>Mote (Opcional):^</label^> >> index.html
echo                     ^<input type="text" id="nickname" placeholder="Ej: Apollo" class="w-full bg-slate-900 border border-slate-700 rounded p-2 text-white mt-1"^> >> index.html
echo                 ^</div^> >> index.html
echo                 ^<div^> >> index.html
echo                     ^<label class="block text-sm text-slate-300"^>Ruta / Lugar de captura:^</label^> >> index.html
echo                     ^<input type="text" id="route" required placeholder="Ej: Ruta 101, Cueva Granito..." class="w-full bg-slate-900 border border-slate-700 rounded p-2 text-white mt-1"^> >> index.html
echo                 ^</div^> >> index.html
echo                 ^<div class="grid grid-cols-2 gap-3"^> >> index.html
echo                     ^<div^> >> index.html
echo                         ^<label class="block text-sm text-slate-300"^>Naturaleza:^</label^> >> index.html
echo                         ^<select id="nature" class="w-full bg-slate-900 border border-slate-700 rounded p-2 text-white mt-1 text-sm"^> >> index.html
echo                             ^<option value="Firme"^>Firme (+Atq, -AtqEsp)^</option^> >> index.html
echo                             ^<option value="Modesta"^>Modesta (+AtqEsp, -Atq)^</option^> >> index.html
echo                             ^<option value="Alegre"^>Alegre (+Vel, -AtqEsp)^</option^> >> index.html
echo                             ^<option value="Miedosa"^>Miedosa (+Vel, -Atq)^</option^> >> index.html
echo                             ^<option value="Osada"^>Osada (+Def, -Atq)^</option^> >> index.html
echo                             ^<option value="Plácida"^>Plácida (+Def, -Vel)^</option^> >> index.html
echo                             ^<option value="Cauta"^>Cauta (+DefEsp, -AtqEsp)^</option^> >> index.html
echo                             ^<option value="Agitada"^>Agitada (+Def, -AtqEsp)^</option^> >> index.html
echo                             ^<option value="Neutra"^>Neutra / Otra^</option^> >> index.html
echo                         ^</select^> >> index.html
echo                     ^</div^> >> index.html
echo                     ^<div^> >> index.html
echo                         ^<label class="block text-sm text-slate-300"^>Habilidad:^</label^> >> index.html
echo                         ^<input type="text" id="ability" required placeholder="Ej: Impulso" class="w-full bg-slate-900 border border-slate-700 rounded p-2 text-white mt-1 text-sm"^> >> index.html
echo                     ^</div^> >> index.html
echo                 ^</div^> >> index.html
echo                 ^<div^> >> index.html
echo                     ^<label class="block text-sm text-slate-300"^>Estado:^</label^> >> index.html
echo                     ^<select id="status" class="w-full bg-slate-900 border border-slate-700 rounded p-2 text-white mt-1"^> >> index.html
echo                         ^<option value="active"^>Vivo (Equipo/Caja)^</option^> >> index.html
echo                         ^<option value="dead"^>Muerto (Cementerio)^</option^> >> index.html
echo                         ^<option value="stolen"^>Robado^</option^> >> index.html
echo                         ^<option value="banned"^>Baneado^</option^> >> index.html
echo                     ^</select^> >> index.html
echo                 ^</div^> >> index.html
echo                 ^<div class="flex justify-end gap-3 mt-6"^> >> index.html
echo                     ^<button type="button" onclick="closeAddModal()" class="bg-slate-700 hover:bg-slate-600 px-4 py-2 rounded text-white"^>Cancelar^</button^> >> index.html
echo                     ^<button type="submit" class="bg-red-600 hover:bg-red-700 px-4 py-2 rounded text-white font-bold"^>Guardar^</button^> >> index.html
echo                 ^</div^> >> index.html
echo             ^</form^> >> index.html
echo         ^</div^> >> index.html
echo     ^</div^> >> index.html
echo. >> index.html
echo     ^<!-- Logica en JavaScript --^> >> index.html
echo     ^<script^> >> index.html
echo         const trainers = Array.from({ length: 24 }, (_, i) =^> `Entrenador ${i + 1}`); >> index.html
echo         const select = document.getElementById('trainerSelect'); >> index.html
echo         trainers.forEach(t =^> { const opt = document.createElement('option'); opt.value = t; opt.textContent = t; select.appendChild(opt); }); >> index.html
echo         let tournamentData = JSON.parse(localStorage.getItem('nuzlocke_oras')) || {}; >> index.html
echo         select.addEventListener('change', renderPokemon); >> index.html
echo         window.addEventListener('DOMContentLoaded', renderPokemon); >> index.html
echo         function openAddModal() { document.getElementById('pokemonModal').classList.remove('hidden'); } >> index.html
echo         function closeAddModal() { document.getElementById('pokemonModal').classList.add('hidden'); document.getElementById('pokemonForm').reset(); } >> index.html
echo         function savePokemon(e) { >> index.html
echo             e.preventDefault(); const currentTrainer = select.value; >> index.html
echo             const newPkmn = { id: Date.now(), species: document.getElementById('species').value, nickname: document.getElementById('nickname').value, route: document.getElementById('route').value, nature: document.getElementById('nature').value, ability: document.getElementById('ability').value, status: document.getElementById('status').value }; >> index.html
echo             if (!tournamentData[currentTrainer]) { tournamentData[currentTrainer] = []; } >> index.html
echo             tournamentData[currentTrainer].push(newPkmn); >> index.html
echo             localStorage.setItem('nuzlocke_oras', JSON.stringify(tournamentData)); >> index.html
echo             closeAddModal(); renderPokemon(); >> index.html
echo         } >> index.html
echo         function deletePokemon(id) { >> index.html
echo             const currentTrainer = select.value; >> index.html
echo             if (tournamentData[currentTrainer]) { >> index.html
echo                 tournamentData[currentTrainer] = tournamentData[currentTrainer].filter(p =^> p.id !== id); >> index.html
echo                 localStorage.setItem('nuzlocke_oras', JSON.stringify(tournamentData)); >> index.html
echo                 renderPokemon(); >> index.html
echo             } >> index.html
echo         } >> index.html
echo         function renderPokemon() { >> index.html
echo             const currentTrainer = select.value; const pkmns = tournamentData[currentTrainer] || []; >> index.html
echo             document.getElementById('list-active').innerHTML = ''; document.getElementById('list-dead').innerHTML = ''; document.getElementById('list-stolen').innerHTML = ''; document.getElementById('list-banned').innerHTML = ''; >> index.html
echo             pkmns.forEach(p =^> { >> index.html
echo                 const card = document.createElement('div'); card.className = "bg-slate-900 p-3 rounded-lg border border-slate-700 flex justify-between items-center"; >> index.html
echo                 card.innerHTML = `^<div^>^<div class="flex items-center gap-2"^>^<span class="font-bold text-white text-lg"^>${p.species}^</span^> ${p.nickname ? `^<span class="text-slate-400 italic text-sm"^>"${p.nickname}"^</span^>` : ''}^</div^>^<div class="text-xs text-slate-400 mt-1"^>📍 ^<span class="text-amber-300 font-medium"^>${p.route}^</span^> ^| Nat: ^<span class="text-slate-200"^>${p.nature}^</span^> ^| Hab: ^<span class="text-slate-200"^>${p.ability}^</span^>^</div^>^</div^>^<button onclick="deletePokemon(${p.id})" class="text-red-400 hover:text-red-300 text-xs font-bold px-2 py-1 bg-red-950/40 rounded border border-red-900"^>Eliminar^</button^>`; >> index.html
echo                 if (p.status === 'active') document.getElementById('list-active').appendChild(card); >> index.html
echo                 if (p.status === 'dead') document.getElementById('list-dead').appendChild(card); >> index.html
echo                 if (p.status === 'stolen') document.getElementById('list-stolen').appendChild(card); >> index.html
echo                 if (p.status === 'banned') document.getElementById('list-banned').appendChild(card); >> index.html
echo             }); >> index.html
echo         } >> index.html
echo     ^</script^> >> index.html
echo ^</body^> >> index.html
echo ^</html^> >> index.html

echo ¡Proyecto creado con éxito! Ya puedes abrir esta carpeta en Visual Studio Code.
pause