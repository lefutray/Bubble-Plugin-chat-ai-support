# Chat AI Support Plugin - Documentación Técnica

## 🎯 Overview
Plugin de Bubble.io que integra OpenAI GPT-3.5-turbo para chat de soporte con IA, incluyendo procesamiento de documentos y contador de tokens en tiempo real.

## 🏗️ Arquitectura

### Estructura del Plugin
```
src/
├── plugin.json          # Configuración principal y elementos
├── shared.html          # CSS + JavaScript compartido
└── assets/             # Recursos adicionales (si los hay)

dist/
└── plugin.json         # Plugin compilado para Bubble

tools/
├── pull_plugin.exs     # Descargar plugin desde Bubble
├── simple_encode.exs   # Codificar archivos JS
└── quick_push.exs      # Subir plugin a Bubble
```

### Elementos Incluidos

#### **Chat AI Support (AAA)**
- **Tipo**: Visual Element
- **Dimensiones por defecto**: 400x500px
- **Categoría**: General
- **Ciclo de vida**: initialize → update → reset

## 🔧 Configuración de Desarrollo

### Requisitos
- Elixir 1.14+
- Cuenta Bubble.io con acceso a plugins
- OpenAI API Key para testing
- Git para control de versiones

### Variables de Entorno
```bash
# .envrc
export PLUGIN_ID="1753925207735x692979894470574100"
export COOKIE="bubble_session_cookie_here"
```

### Comandos de Desarrollo
```bash
# Descargar plugin desde Bubble
source .envrc && elixir pull_plugin.exs

# Codificar archivos JavaScript
elixir simple_encode.exs

# Subir plugin a Bubble
source .envrc && elixir quick_push.exs
```

## 📋 Propiedades del Elemento

### Campos Configurables
```javascript
{
  "openai_api_key": {
    "caption": "OpenAI API Key",
    "doc": "Tu clave de API de OpenAI para el chat con IA",
    "editor": "DynamicValue",
    "name": "openai_api_key",
    "optional": false,      // ⚠️ REQUERIDO
    "rank": 0,
    "value": "text"
  },
  "max_tokens": {
    "caption": "Max Tokens por consulta",
    "doc": "Límite máximo de tokens por consulta (por defecto: 500)",
    "editor": "DynamicValue",
    "name": "max_tokens",
    "optional": true,
    "rank": 1,
    "value": "number"
  },
  "welcome_message": {
    "caption": "Mensaje de bienvenida",
    "doc": "Mensaje inicial que mostrará el asistente IA",
    "editor": "DynamicValue",
    "name": "welcome_message",
    "optional": true,
    "rank": 2,
    "value": "text"
  },
  "theme_color": {
    "caption": "Color del tema",
    "doc": "Color principal para la interfaz del chat",
    "editor": "DynamicValue",
    "name": "theme_color",
    "optional": true,
    "rank": 3,
    "value": "text"
  }
}
```

## 🎨 Arquitectura CSS

### Principios de Diseño
- **Namespace**: Todos los estilos usan `.bubble-element` prefix
- **CSS Variables**: `--theme-color` para personalización
- **Responsive**: Mobile-first approach
- **Modular**: Componentes independientes

### Estructura de Clases
```css
.bubble-element .chat-ai-support-container    # Contenedor principal
├── .chat-container                           # Chat principal
│   ├── .chat-header                         # Header con título y controles
│   ├── .chat-messages                       # Área de mensajes
│   └── .chat-input-container               # Input y controles
├── .document-panel                          # Panel de documentos
└── .toast-container                         # Notificaciones
```

### Variables CSS Customizables
```css
.bubble-element {
  --theme-color: #667eea;     /* Color principal */
  --border-radius: 12px;      /* Bordes redondeados */
  --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
}
```

## ⚙️ JavaScript Architecture

### Clase Principal: `BubbleChatAI`
```javascript
class BubbleChatAI {
  constructor(instance, properties) {
    this.instance = instance;        // Referencia al elemento Bubble
    this.properties = properties;    // Propiedades configuradas
    this.messages = [];             // Historial de mensajes
    this.documents = [];            // Documentos cargados
    this.sessionTokens = 0;         // Tokens consumidos
  }
}
```

### Métodos Principales
```javascript
// Ciclo de vida
init()                    // Inicialización
bindEvents()             // Event listeners
destroy()                // Cleanup

// Chat
sendMessage()            // Enviar mensaje usuario
generateAIResponse()     // Llamada a OpenAI API
addMessage()             // Añadir mensaje al chat
showTypingIndicator()    // Indicador "escribiendo"

// Documentos
handleFileUpload()       // Procesar archivos subidos
processDocument()        // Análisis de documento
summarizeDocument()      // Generar resumen
updateDocumentsList()    // Actualizar UI

// Utilidades
updateTokenCounter()     // Actualizar contador
showToast()              // Notificaciones
scrollToBottom()         // Auto-scroll chat
```

## 🔌 Integración OpenAI

### Configuración API
```javascript
const config = {
  OPENAI_BASE_URL: 'https://api.openai.com/v1/chat/completions',
  MODEL: 'gpt-3.5-turbo',
  TEMPERATURE: 0.7,
  SYSTEM_PROMPT: `Eres un asistente de IA especializado...`
};
```

### Flujo de Llamada API
```javascript
// 1. Preparar contexto
let contextInfo = prepareDocumentContext();
let conversationContext = getRecentMessages(4);

// 2. Construir payload
const messages = [
  { role: 'system', content: SYSTEM_PROMPT + contextInfo },
  ...conversationContext,
  { role: 'user', content: userMessage }
];

// 3. Llamada API
const response = await fetch(OPENAI_BASE_URL, {
  method: 'POST',
  headers: {
    'Authorization': `Bearer ${api_key}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    model: 'gpt-3.5-turbo',
    messages: messages,
    max_tokens: maxTokens,
    temperature: 0.7
  })
});

// 4. Procesar respuesta
const data = await response.json();
updateTokenCounter(data.usage.total_tokens);
return data.choices[0].message.content;
```

## 📊 Manejo de Tokens

### Contador en Tiempo Real
```javascript
updateTokenCounter(tokensUsed = 0) {
  const tokenCounter = document.getElementById(`tokenCounter-${id}`);
  
  // Formatear número
  const tokensText = this.sessionTokens < 1000 
    ? `${formatNumber(this.sessionTokens)} tokens`
    : `${formatNumber(Math.round(this.sessionTokens / 100) / 10)}k tokens`;
  
  // Actualizar UI con animación
  tokenCounter.textContent = tokensText;
  tokenCounter.style.transform = 'scale(1.1)';
  setTimeout(() => tokenCounter.style.transform = 'scale(1)', 200);
}
```

### Optimización de Tokens
- Limitación de contexto conversacional (4 mensajes)
- Truncado inteligente de documentos largos
- Estimación de tokens antes de envío
- Fallback a respuestas simuladas si falla API

## 🔐 Seguridad

### Validaciones
```javascript
// API Key validation
if (!this.properties.openai_api_key) {
  return 'Por favor, configura tu API key...';
}

// File validation
validateFile(file) {
  const maxSize = 10 * 1024 * 1024; // 10MB
  const allowedTypes = ['.txt', '.pdf', '.docx', '.md'];
  // Validaciones...
}

// Input sanitization
formatMessageText(text) {
  return text
    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
    .replace(/\*(.*?)\*/g, '<em>$1</em>')
    .replace(/`(.*?)`/g, '<code>$1</code>');
}
```

## 🧪 Testing

### Testing Manual
1. **Instalación**: Verificar elemento aparece en Bubble
2. **Configuración**: Probar con/sin API key
3. **Chat básico**: Enviar mensajes simples
4. **Documentos**: Subir diferentes formatos
5. **Tokens**: Verificar contador funciona
6. **Responsive**: Probar en diferentes tamaños

## 🚀 Despliegue

### Proceso de Release
```bash
# 1. Desarrollo local
# Modificar archivos en src/

# 2. Testing
# Probar cambios localmente

# 3. Subir a Bubble
source .envrc && elixir quick_push.exs

# 4. Validar en Bubble
# Probar plugin en editor de Bubble

# 5. Publish
# Marcar plugin como público en Bubble
```

## 📈 Roadmap

### v1.1 (Próxima)
- [ ] Soporte para GPT-4
- [ ] Más formatos de documentos (XLSX, PPTX)
- [ ] Exportar conversaciones
- [ ] Temas predefinidos

### v1.2 (Futuro)
- [ ] Integración con Bubble Database
- [ ] Webhooks para notificaciones
- [ ] Analytics avanzados
- [ ] Multi-idioma

**Desarrollado con ❤️ para la comunidad Bubble.io**