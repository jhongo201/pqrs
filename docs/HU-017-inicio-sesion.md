# HU-017: Inicio de Sesión

## Descripción
**Como** usuario registrado  
**Quiero** poder iniciar sesión en el sistema con mi nombre de usuario y contraseña  
**Para** acceder a las funcionalidades según mi rol y permisos

## Criterios de Aceptación

1. **Dado que** soy un usuario registrado  
   **Cuando** accedo a la página de inicio de sesión  
   **Entonces** el sistema debe mostrar un formulario solicitando nombre de usuario y contraseña

2. **Dado que** estoy en la página de inicio de sesión  
   **Cuando** ingreso credenciales válidas (nombre de usuario y contraseña correctos)  
   **Entonces** el sistema debe:
   - Autenticarme correctamente
   - Generar un token JWT
   - Redirigirme al dashboard o página principal
   - Registrar la fecha y hora de mi inicio de sesión

3. **Dado que** estoy en la página de inicio de sesión  
   **Cuando** ingreso credenciales inválidas  
   **Entonces** el sistema debe mostrar un mensaje de error indicando que las credenciales son incorrectas

4. **Dado que** estoy en la página de inicio de sesión  
   **Cuando** ingreso credenciales de un usuario inactivo  
   **Entonces** el sistema debe mostrar un mensaje indicando que la cuenta está desactivada

5. **Dado que** estoy en la página de inicio de sesión  
   **Cuando** he olvidado mi contraseña  
   **Entonces** el sistema debe proporcionar una opción para recuperar o restablecer mi contraseña

6. **Dado que** he iniciado sesión correctamente  
   **Cuando** navego por el sistema  
   **Entonces** debo tener acceso solo a las funcionalidades permitidas según mi rol y permisos

7. **Dado que** he iniciado sesión correctamente  
   **Cuando** mi sesión ha estado inactiva por un período prolongado  
   **Entonces** el sistema debe expirar mi sesión y solicitarme que inicie sesión nuevamente

8. **Dado que** estoy intentando iniciar sesión  
   **Cuando** he realizado múltiples intentos fallidos  
   **Entonces** el sistema debe implementar un mecanismo de protección contra ataques de fuerza bruta

## Definición Técnica

### Endpoint
```
POST /api/auth/login
```

### Payload de Solicitud
```json
{
  "username": "pedro.martinez",
  "password": "Contraseña123!"
}
```

### Respuesta Exitosa
```json
{
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "username": "pedro.martinez",
  "rol": "FUNCIONARIO"
}
```

### Respuesta de Error
```json
{
  "error": "Credenciales inválidas",
  "timestamp": "2025-05-19T10:30:00"
}
```

## Mockup de Interfaz

```
+-------------------------------------------------------+
|                  INICIO DE SESIÓN                     |
+-------------------------------------------------------+
|                                                       |
|           MINISTERIO DE TRABAJO                       |
|           SISTEMA DE PQRS                             |
|                                                       |
| +---------------------------------------------------+ |
| |                                                   | |
| | Nombre de Usuario:                                | |
| | [                                            ]    | |
| |                                                   | |
| | Contraseña:                                       | |
| | [                                            ]    | |
| |                                                   | |
| | [   INICIAR SESIÓN   ]                            | |
| |                                                   | |
| | ¿Olvidó su contraseña? [Recuperar contraseña]     | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| ¿No tiene una cuenta?                                 |
| Para crear una PQRS sin registrarse, haga clic        |
| [aquí]                                                |
|                                                       |
+-------------------------------------------------------+
```

## Notas Adicionales
- El sistema debe implementar JWT (JSON Web Tokens) para la autenticación
- La contraseña debe transmitirse de forma segura (HTTPS)
- El sistema debe validar la vigencia del token en cada solicitud
- Se debe implementar un mecanismo de renovación de tokens
- El sistema debe registrar los intentos de inicio de sesión (exitosos y fallidos) para auditoría
- La sesión debe expirar después de un período de inactividad (por ejemplo, 30 minutos)
- El sistema debe implementar un límite de intentos fallidos de inicio de sesión (por ejemplo, 5 intentos)
- Las contraseñas deben almacenarse de forma segura utilizando algoritmos de hash modernos (como BCrypt)
- El sistema debe soportar integración con LDAP para autenticación corporativa
