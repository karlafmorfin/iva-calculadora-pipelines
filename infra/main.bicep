<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Calculadora de IVA</title>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <style>
    body {
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
      max-width: 480px;
      margin: 40px auto;
      padding: 0 16px;
    }
    label { display: block; margin-top: 16px; }
    input {
      width: 100%;
      padding: 8px;
      margin-top: 4px;
      box-sizing: border-box;
    }
    button {
      margin-top: 20px;
      padding: 10px 16px;
      border: none;
      cursor: pointer;
    }
    .result {
      margin-top: 24px;
      padding: 12px;
      border: 1px solid #ddd;
    }
  </style>
</head>
<body>
  <h1>Calculadora de IVA</h1>

  <label>
    Subtotal (sin IVA):
    <input type="number" id="subtotal" step="0.01" placeholder="Ej. 1000" />
  </label>

  <label>
    IVA (%):
    <input type="number" id="iva" step="0.01" value="16" />
  </label>

  <button type="button" onclick="calcular()">Calcular</button>

  <div id="resultado" class="result" style="display:none;"></div>

  <script>
    function calcular() {
      const subtotal = parseFloat(document.getElementById('subtotal').value);
      const ivaPorcentaje = parseFloat(document.getElementById('iva').value);

      if (isNaN(subtotal) || isNaN(ivaPorcentaje)) {
        alert('Escribe números válidos');
        return;
      }

      const ivaMonto = subtotal * (ivaPorcentaje / 100);
      const total = subtotal + ivaMonto;

      const resultadoDiv = document.getElementById('resultado');
      resultadoDiv.style.display = 'block';
      resultadoDiv.innerHTML = `
        Subtotal: ${subtotal.toFixed(2)}<br>
        IVA (${ivaPorcentaje}%): ${ivaMonto.toFixed(2)}<br>
        <strong>Total: ${total.toFixed(2)}</strong>
      `;
    }
  </script>
</body>
</html>
