# HU-014: Dashboard de Estadísticas

## Descripción
**Como** coordinador o administrador  
**Quiero** visualizar estadísticas generales sobre las PQRS  
**Para** tener una visión general del estado del sistema y tomar decisiones informadas

## Criterios de Aceptación

1. **Dado que** soy un coordinador o administrador  
   **Cuando** accedo al dashboard de estadísticas  
   **Entonces** el sistema debe mostrar indicadores clave de rendimiento (KPIs) sobre las PQRS

2. **Dado que** estoy visualizando el dashboard  
   **Cuando** observo la sección de PQRS por estado  
   **Entonces** debo ver un gráfico que muestre la distribución de PQRS por estado (pendiente, en proceso, resuelto, cerrado)

3. **Dado que** estoy visualizando el dashboard  
   **Cuando** observo la sección de PQRS por prioridad  
   **Entonces** debo ver un gráfico que muestre la distribución de PQRS por prioridad (alta, media, baja)

4. **Dado que** estoy visualizando el dashboard  
   **Cuando** observo la sección de PQRS por área  
   **Entonces** debo ver un gráfico que muestre la distribución de PQRS por área organizacional

5. **Dado que** estoy visualizando el dashboard  
   **Cuando** observo la sección de tiempo promedio de respuesta  
   **Entonces** debo ver un indicador que muestre el tiempo promedio que toma resolver una PQRS

6. **Dado que** estoy visualizando el dashboard  
   **Cuando** observo la sección de tendencia mensual  
   **Entonces** debo ver un gráfico que muestre la cantidad de PQRS recibidas por mes

7. **Dado que** estoy visualizando el dashboard  
   **Cuando** deseo filtrar las estadísticas por un período específico  
   **Entonces** el sistema debe permitirme seleccionar un rango de fechas y actualizar los datos en consecuencia

8. **Dado que** estoy visualizando el dashboard  
   **Cuando** deseo ver más detalles sobre un indicador específico  
   **Entonces** debo poder hacer clic en el indicador para ver información más detallada

## Definición Técnica

### Endpoint
```
GET /api/pqrs/estadisticas/dashboard
```

### Respuesta Exitosa
```json
{
  "pqrs": {
    "total": 120,
    "pendientes": 15,
    "enProceso": 45,
    "resueltas": 50,
    "cerradas": 10,
    "porEstado": [
      {"estado": "PENDIENTE", "cantidad": 15},
      {"estado": "EN_PROCESO", "cantidad": 45},
      {"estado": "RESUELTO", "cantidad": 50},
      {"estado": "CERRADO", "cantidad": 10}
    ],
    "porPrioridad": [
      {"prioridad": "ALTA", "cantidad": 25},
      {"prioridad": "MEDIA", "cantidad": 65},
      {"prioridad": "BAJA", "cantidad": 30}
    ],
    "porArea": [
      {"area": "Atención al Ciudadano", "cantidad": 45},
      {"area": "Recursos Humanos", "cantidad": 30},
      {"area": "Sistemas", "cantidad": 25},
      {"area": "Contabilidad", "cantidad": 20}
    ],
    "tiempoPromedioRespuesta": 3.5,
    "tendenciaMensual": [
      {"mes": "Enero", "cantidad": 15},
      {"mes": "Febrero", "cantidad": 18},
      {"mes": "Marzo", "cantidad": 22},
      {"mes": "Abril", "cantidad": 20},
      {"mes": "Mayo", "cantidad": 25}
    ]
  },
  "usuarios": {
    "total": 25,
    "activos": 22,
    "inactivos": 3,
    "porRol": [
      {"rol": "Administrador", "cantidad": 2},
      {"rol": "Coordinador", "cantidad": 5},
      {"rol": "Funcionario", "cantidad": 18}
    ]
  }
}
```

## Mockup de Interfaz

```
+-------------------------------------------------------+
|                 DASHBOARD DE ESTADÍSTICAS             |
+-------------------------------------------------------+
| Período: [01/01/2025] - [31/05/2025]  [  Aplicar  ]   |
|                                                       |
| INDICADORES CLAVE                                     |
| +------------+ +------------+ +------------+          |
| |    120     | |    3.5     | |    25%     |          |
| | Total PQRS | |Días promedio| |  PQRS Alta |          |
| |            | | respuesta  | | prioridad  |          |
| +------------+ +------------+ +------------+          |
|                                                       |
| DISTRIBUCIÓN POR ESTADO                               |
| +---------------------------------------------------+ |
| |                                                   | |
| |  [Gráfico circular mostrando distribución por     | |
| |   estado: Pendiente, En Proceso, Resuelto,        | |
| |   Cerrado]                                        | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
| DISTRIBUCIÓN POR PRIORIDAD    | DISTRIBUCIÓN POR ÁREA |
| +-------------------------+   +----------------------+ |
| |                         |   |                      | |
| | [Gráfico de barras      |   | [Gráfico de barras   | |
| |  horizontal por         |   |  horizontal por      | |
| |  prioridad]             |   |  área]               | |
| |                         |   |                      | |
| +-------------------------+   +----------------------+ |
|                                                       |
| TENDENCIA MENSUAL                                     |
| +---------------------------------------------------+ |
| |                                                   | |
| | [Gráfico de línea mostrando la tendencia de PQRS  | |
| |  recibidas por mes]                               | |
| |                                                   | |
| +---------------------------------------------------+ |
|                                                       |
|                [   EXPORTAR DATOS   ]                 |
+-------------------------------------------------------+
```

## Notas Adicionales
- El dashboard debe actualizarse automáticamente cada cierto tiempo (por ejemplo, cada 5 minutos)
- Los gráficos deben ser interactivos, permitiendo al usuario obtener más información al pasar el cursor sobre ellos
- Se debe permitir la exportación de los datos en formatos como CSV o Excel
- Los colores utilizados en los gráficos deben seguir un código consistente (por ejemplo, rojo para alta prioridad, amarillo para media, verde para baja)
- El sistema debe optimizar las consultas para garantizar un rendimiento adecuado incluso con grandes volúmenes de datos
- Solo los usuarios con rol de Administrador o Coordinador deben tener acceso al dashboard
- El dashboard debe ser responsivo para adaptarse a diferentes tamaños de pantalla
- Se debe incluir una leyenda explicativa para cada gráfico
