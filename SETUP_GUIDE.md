# 🚀 Guía de Setup Rápido - Chat AI Support Plugin

## ⚡ Setup en 5 Minutos

### 1. 📋 **Pre-requisitos**
- ✅ Cuenta Bubble.io (plan Hobby o superior)
- ✅ OpenAI API Key ([obtener aquí](https://platform.openai.com/api-keys))
- ✅ Créditos disponibles en OpenAI (~$5 USD recomendado)

### 2. 🔧 **Instalación del Plugin**

#### En el Editor de Bubble:
```
1. Ve a "Plugins" en el panel izquierdo
2. Busca "Chat AI Support" 
3. Click "Install"
4. Acepta permisos
```

### 3. 🎨 **Añadir Elemento a tu Página**

#### Arrastrar y Configurar:
```
1. Desde "Visual elements" → "Chat AI Support"
2. Arrastra al área de diseño
3. Tamaño recomendado: 400px × 500px
4. Posición: Donde prefieras (esquina, centro, modal)
```

### 4. ⚙️ **Configuración Obligatoria**

#### OpenAI API Key (REQUERIDO):
```
Campo: "OpenAI API Key"
Valor: tu-api-key-aquí
Ejemplo: sk-proj-abc123defg456hijklmn...

⚠️ SIN ESTA CONFIGURACIÓN EL PLUGIN NO FUNCIONARÁ
```

#### ¿Cómo obtener tu API Key?
```bash
1. Ve a: https://platform.openai.com/api-keys
2. Crear cuenta o login
3. Click "Create new secret key"
4. Nombre: "Bubble Chat AI"
5. Copiar la key (empieza con sk-proj-)
6. ⚠️ Guárdala segura, no se puede ver después
```

### 5. 🎯 **Configuración Opcional (Recomendada)**

```javascript
// Configuraciones recomendadas
{
  "max_tokens": 750,                    // Más respuestas detalladas
  "welcome_message": "¡Hola! Soy el asistente de [TU MARCA]. ¿Cómo puedo ayudarte?",
  "theme_color": "#your-brand-color"    // Color de tu marca
}
```

### 6. ✅ **Verificar Funcionamiento**

#### Test Rápido:
```
1. Vista Preview de tu página
2. Debería aparecer el chat con mensaje de bienvenida
3. Escribe: "Hola"
4. Debería responder la IA
5. ✅ ¡Funciona!
```

---

## 🎨 **Configuraciones Populares**

### 🏢 **Para Business/SaaS**
```json
{
  "max_tokens": 500,
  "welcome_message": "¡Hola! Soy tu asistente de soporte. Puedo ayudarte con documentación, preguntas técnicas y resolver dudas. ¿En qué puedo asistirte?",
  "theme_color": "#2563eb"
}
```

### 🎓 **Para Educación**
```json
{
  "max_tokens": 750,
  "welcome_message": "¡Hola estudiante! Soy tu tutor virtual. Puedo ayudarte con tareas, explicar conceptos y analizar documentos. ¿Qué tema estudiaremos hoy?",
  "theme_color": "#059669"
}
```

### 🏥 **Para Salud/Wellness**
```json
{
  "max_tokens": 600,
  "welcome_message": "Hola, soy tu asistente de información de salud. Puedo ayudarte con documentos médicos y preguntas generales. ¿En qué puedo ayudarte? (No sustituyo consulta médica)",
  "theme_color": "#dc2626"
}
```

### 💼 **Para Consultores**
```json
{
  "max_tokens": 800,
  "welcome_message": "¡Bienvenido! Soy tu asistente de consultoría. Especializado en análisis de documentos, reportes y insights estratégicos. ¿Qué analizamos hoy?",
  "theme_color": "#7c3aed"
}
```

---

## 🔍 **Troubleshooting Común**

### ❌ "Por favor, configura tu API key..."
```
Problema: API Key no configurada
Solución: Añadir API Key válida en properties del elemento
```

### ❌ "Error procesando mensaje"
```
Problema: API Key inválida o sin créditos
Solución: 
1. Verificar API Key es correcta
2. Revisar créditos en OpenAI dashboard
3. Verificar conectividad internet
```

### ❌ "Chat no aparece"
```
Problema: Elemento muy pequeño o CSS conflicts
Solución:
1. Aumentar tamaño elemento (min 300x400px)
2. Revisar z-index si está detrás de otros elementos
3. Refrescar página (hard refresh)
```

### ❌ "Documentos no se procesan"
```
Problema: Archivo muy grande o formato no soportado
Solución:
1. Usar archivos < 10MB
2. Formatos soportados: TXT, PDF, DOCX, MD
3. Verificar archivo no está corrupto
```

---

## 💰 **Estimación de Costos OpenAI**

### Uso Típico:
```
📊 Consulta promedio: ~300 tokens
💰 Costo por consulta: ~$0.0006 USD
📈 100 consultas/día: ~$0.06 USD/día
📅 Mensual (3K consultas): ~$1.80 USD/mes
```

### Tips para Optimizar Costos:
- ✅ Usar `max_tokens: 500` (balanceado)
- ✅ Documentos concisos < 5MB
- ✅ Monitorear usage en OpenAI dashboard
- ✅ Configurar billing alerts en OpenAI

---

## 📱 **Responsive Testing**

### Tamaños Recomendados:
```css
Desktop: 400px × 500px (óptimo)
Tablet:  350px × 450px (bueno)  
Mobile:  320px × 400px (mínimo)
```

### Test Checklist:
- [ ] Chat visible en desktop
- [ ] Responsive en mobile
- [ ] Botones clickeables en touch
- [ ] Scroll funciona correctamente
- [ ] Contador tokens visible

---

## 🎯 **Ejemplos de Uso Real**

### 📚 **Caso 1: Soporte Técnico**
```
Usuario: "Tengo un error con mi app"
IA: "Perfecto, te ayudo. Puedes subir capturas de pantalla o logs del error usando el botón 📎. Mientras tanto, ¿podrías describir qué estabas haciendo cuando ocurrió?"
```

### 📄 **Caso 2: Análisis de Documentos**
```
Usuario: [Sube PDF de 20 páginas]
IA: "He procesado tu documento de 20 páginas. Puedo ayudarte con resúmenes, extraer puntos clave, o responder preguntas específicas. ¿Qué necesitas?"
```

### 💡 **Caso 3: Consultoría**
```
Usuario: "Necesito analizar esta propuesta comercial"
IA: "Excelente. Sube el documento y puedo ayudarte con: análisis FODA, puntos de negociación, riesgos identificados, y recomendaciones estratégicas."
```

---

## 🚀 **¡Listo para Lanzar!**

Con esta configuración tendrás:
- ✅ Chat IA funcional en tu app Bubble
- ✅ Procesamiento de documentos
- ✅ Interfaz profesional y responsive  
- ✅ Control de costos y tokens
- ✅ Experiencia de usuario premium

### 📞 **¿Necesitas Ayuda?**
- 📖 Lee la documentación completa: `PLUGIN_DOCUMENTATION.md`
- 🛠️ Para desarrolladores: `DEVELOPER_README.md`
- 🐛 Issues: Reporta problemas en GitHub
- 💬 Community: Bubble forum

---

**¡Tu asistente de IA está listo para ayudar a tus usuarios! 🤖✨**

*Happy Building! 🚀*