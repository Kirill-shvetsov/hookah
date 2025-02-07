<!DOCTYPE html>
<html>
<head>
    <title>Миксер вкусов для кальяна</title>
    <meta charset="UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        .result {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Миксер вкусов для кальяна</h1>
    <div>
        <label for="flavors">Введите вкусы через запятую:</label><br>
        <input type="text" id="flavors" size="50"><br><br>
        <button onclick="generateMixes()">Сгенерировать миксы</button>
    </div>
    <div id="result" class="result"></div>

    <script>
        function generateMixes() {
            const flavorsInput = document.getElementById('flavors').value;
            const flavors = flavorsInput.split(',').map(f => f.trim()).filter(f => f);
            const result = document.getElementById('result');
            const allMixes = [];
            
            function generateMixesRecursive(currentMix, start) {
                if (currentMix.length > 0) {
                    allMixes.push([...currentMix]);
                }
                
                for (let i = start; i < flavors.length; i++) {
                    currentMix.push(flavors[i]);
                    generateMixesRecursive(currentMix, i + 1);
                    currentMix.pop();
                }
            }
            
            generateMixesRecursive([], 0);
            
            result.innerHTML = '<h2>Возможные миксы:</h2><ul>' + 
                allMixes.map(mix => '<li>' + mix.join(' + ') + '</li>').join('') +
                '</ul>';
        }
    </script>
</body>
</html>
