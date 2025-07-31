# Chat AI Support Plugin - Documentación para Usuarios

## 🤖 Descripción
Plugin de chat de soporte con IA integrado para asistir a usuarios con documentos y consultas. Utiliza OpenAI GPT-3.5-turbo para proporcionar respuestas inteligentes y contextualizar.

## ✨ Características Principales

### 🎨 Interfaz Moderna y Responsive
- Diseño minimalista y elegante
- Compatible con dispositivos móviles y desktop
- Animaciones fluidas y profesionales
- Indicadores de estado en tiempo real

### 🤖 IA Avanzada
- **OpenAI GPT-3.5-turbo** integrado
- Respuestas contextuales inteligentes
- Especializado en análisis de documentos
- Conversaciones naturales en español

### 📄 Procesamiento de Documentos
- Soporte para múltiples formatos: TXT, PDF, DOCX, MD
- Subida mediante drag & drop o selección
- Análisis y resúmenes automáticos
- Consultas específicas sobre contenido

### 📊 Control de Tokens
- Contador visual de tokens consumidos
- Optimización automática de consultas
- Límites configurables por elemento
- Formato inteligente (1.2k tokens)

## 🚀 Instalación y Configuración

### 1. Instalar el Plugin
1. En el editor de Bubble, ve a **Plugins**
2. Busca "**Chat AI Support**"
3. Haz clic en **Install**

### 2. Añadir el Elemento
1. En el editor visual, arrastra el elemento **"Chat AI Support"**
2. Ajusta el tamaño según necesites (recomendado: 400x500px)
3. El elemento se adapta automáticamente

### 3. Configuración Obligatoria

#### OpenAI API Key ⚠️ **REQUERIDO**
```
Campo: OpenAI API Key
Tipo: Text
Descripción: Tu clave API de OpenAI
Ejemplo: sk-proj-abc123...
```

**¿Cómo obtener tu API Key?**
1. Ve a [platform.openai.com](https://platform.openai.com)
2. Crea una cuenta o inicia sesión
3. Ve a **API Keys** → **Create new secret key**
4. Copia la clave y pégala en el campo

### 4. Configuraciones Opcionales

#### Max Tokens por Consulta
```
Campo: Max Tokens por consulta
Tipo: Number
Por defecto: 500
Descripción: Límite de tokens por respuesta de IA
```

#### Mensaje de Bienvenida
```
Campo: Mensaje de bienvenida
Tipo: Text
Por defecto: "¡Hola! Soy tu asistente IA..."
Descripción: Primer mensaje que verá el usuario
```

#### Color del Tema
```
Campo: Color del tema
Tipo: Text
Ejemplo: #667eea
Descripción: Color principal de la interfaz
```

## 🎯 Cómo Usar

### Para Usuarios Finales

#### 1. **Chat Básico**
- Escribe tu mensaje en el campo de texto
- Presiona **Enter** o el botón de envío
- La IA responderá en segundos

#### 2. **Subir Documentos**
- Haz clic en **📎 Documentos**
- Selecciona archivos (TXT, PDF, DOCX, MD)
- Espera el procesamiento automático
- Haz preguntas sobre el contenido

#### 3. **Gestión de Documentos**
- **📄 Resumir**: Genera resumen automático
- **🗑️ Eliminar**: Quita documento de la sesión
- Panel colapsable para ahorrar espacio

#### 4. **Controles del Chat**
- **−** Minimizar chat
- **×** Cerrar chat (con confirmación)
- Contador de tokens en tiempo real

### Ejemplos de Uso

#### Consultas Generales
```
"¿Qué puedes hacer?"
"Explícame sobre inteligencia artificial"
"¿Cómo puedo mejorar mi productividad?"
```

#### Análisis de Documentos
```
"Resume este documento"
"¿Cuáles son los puntos principales?"
"Busca información sobre [tema específico]"
"Crea una lista de acciones del documento"
```

## 🛠️ Personalización Avanzada

### Estilos CSS Personalizados
El plugin utiliza variables CSS que puedes sobrescribir:

```css
.bubble-element .chat-container {
    --theme-color: #667eea; /* Color principal */
    --border-radius: 12px;   /* Bordes redondeados */
}
```

### Responsive Design
El elemento se adapta automáticamente:
- **Desktop**: Diseño completo con panel lateral
- **Tablet**: Interfaz optimizada
- **Mobile**: Controles touch-friendly

## 📋 Requisitos del Sistema

### Bubble.io
- Plan Hobby o superior (para plugins)
- Uso de jQuery habilitado (automático)

### OpenAI
- Cuenta activa en OpenAI
- Créditos disponibles en tu cuenta
- API Key válida

### Navegadores Compatibles
- Chrome 70+
- Firefox 65+
- Safari 12+
- Edge 79+

## 💰 Costos y Límites

### OpenAI API
- **Modelo**: GPT-3.5-turbo
- **Costo**: ~$0.002 por 1K tokens
- **Estimación**: 500 tokens ≈ 375 palabras
- **Ejemplo**: 100 consultas ≈ $1 USD

### Límites Técnicos
- **Documentos**: 10MB máximo por archivo
- **Sesión**: Sin límite de mensajes
- **Tokens**: Configurable (500 por defecto)
- **Archivos simultáneos**: Múltiples

## 🔧 Solución de Problemas

### "Por favor, configura tu API key..."
- **Causa**: API Key no configurada o inválida
- **Solución**: Verifica y actualiza la API Key

### "Error procesando mensaje"
- **Causa**: Problema de conexión o límite de tokens
- **Solución**: Revisa tu cuenta OpenAI y conectividad

### El chat no aparece
- **Causa**: Elemento muy pequeño o CSS conflictivo
- **Solución**: Aumenta el tamaño o revisa estilos

### Documentos no se procesan
- **Causa**: Archivo muy grande o formato no soportado
- **Solución**: Usar archivos < 10MB en formato soportado

## 📞 Soporte

### Documentación Técnica
- **GitHub**: [Repositorio del Plugin]
- **Bubble Forum**: Chat AI Support

### Contacto
- **Email**: Consulta con el desarrollador
- **Discord**: Comunidad de Bubble

## 🔄 Actualizaciones

### Versión Actual: 1.0.0
- Lanzamiento inicial
- OpenAI GPT-3.5-turbo
- Procesamiento de documentos
- Contador de tokens

### Próximas Funciones
- Soporte para GPT-4
- Más formatos de documentos
- Temas personalizables
- Exportar conversaciones

---

## 📝 Ejemplo Completo de Configuración

### Configuración Mínima
```
✅ OpenAI API Key: sk-proj-abc123...
✅ Elemento añadido a la página
✅ Tamaño: 400x500px
```

### Configuración Recomendada
```
✅ OpenAI API Key: sk-proj-abc123...
✅ Max Tokens: 750
✅ Mensaje de bienvenida: "¡Hola! Soy el asistente de [Tu Marca]. ¿Cómo puedo ayudarte?"
✅ Color del tema: #your-brand-color
✅ Elemento: 450x600px
```

**¡Listo! Tu chat de IA está configurado y funcionando.** 🎉

### Tips Finales
- Mantén la API Key segura y privada
- Monitorea el uso de tokens en OpenAI
- Personaliza el mensaje de bienvenida para tu marca
- Prueba con diferentes tipos de documentos
- Los usuarios pueden subir múltiples archivos por sesión

¡Disfruta de tu nuevo asistente de IA integrado! 🤖✨