/****** consultar personas  ******/
SELECT *
  FROM [roles].[dbo].[personas]
  
  UPDATE [roles].[dbo].[personas]
  SET email ='juan1@yopmail.com'
  WHERE id_persona = 1009;

  /****** Consultar Usuarios  ******/
SELECT *
  FROM [roles].[dbo].[usuarios]

UPDATE [roles].[dbo].[usuarios]
  SET estado =1
  WHERE id_usuario = 1;

  /****** Consultar empresas  ******/ -- de pruebas es la empresa id=5
SELECT *
  FROM [roles].[dbo].[empresas]

  /****** Consultar territoriales  ******/--de pruebas id=3
SELECT *
  FROM [roles].[dbo].[territoriales]


/****** Consultar Direcciones  ******/--de pruebas id=4
SELECT *
  FROM [roles].[dbo].[direcciones]

/****** Consultar Areas  ******/--tengo 4 la 1 esta inactiva
SELECT *
  FROM [roles].[dbo].[areas]


/****** Consulta que une todas las anteriores en una sola  ******/
SELECT 
    u.id_usuario,
    u.username,
   -- u.ultimo_login,
    u.estado AS estado_usuario,
    p.id_persona,
    p.nombres,
    p.apellidos,
  --  p.tipo_documento,
  --  p.numero_documento,
    p.email AS email_persona,
  --  p.telefono AS telefono_persona,
    p.estado AS estado_persona,
  --  p.fecha_creacion AS fecha_creacion_persona,
    a.id_area,
    a.nombre AS nombre_area,
    a.descripcion AS descripcion_area,
    a.estado AS estado_area,
    d.id_direccion,
    d.nombre AS nombre_direccion,
  --  d.descripcion AS descripcion_direccion,
    d.estado AS estado_direccion,
    t.id_territorial,
    t.nombre AS nombre_territorial,
  --  t.codigo AS codigo_territorial,
  --  t.descripcion AS descripcion_territorial,
    t.estado AS estado_territorial,
    e.id_empresa,
    e.nombre AS nombre_empresa,
  --  e.nit,
    e.direccion AS direccion_empresa,
  --  e.telefono AS telefono_empresa,
    e.email AS email_empresa,
    e.estado AS estado_empresa
  --  e.fecha_creacion AS fecha_creacion_empresa
FROM roles.dbo.usuarios u
LEFT JOIN roles.dbo.personas p ON u.id_persona = p.id_persona
LEFT JOIN roles.dbo.areas a ON p.id_area = a.id_area
LEFT JOIN roles.dbo.direcciones d ON a.id_direccion = d.id_direccion
LEFT JOIN roles.dbo.territoriales t ON d.id_territorial = t.id_territorial
LEFT JOIN roles.dbo.empresas e ON t.id_empresa = e.id_empresa
Where p.id_area = 1;






  INSERT INTO permisos_rol (id_rol, id_ruta, puede_leer, puede_escribir, puede_eliminar, estado, fecha_creacion, puede_actualizar)
VALUES 
(
    1, -- id_rol para administrador (ajusta según tu catálogo de roles)
    1013,
    1, -- puede leer
    0, -- no puede escribir (es un endpoint de solo lectura)
    0, -- no puede eliminar
    1, -- estado activo
    GETDATE(),
    0  -- no puede actualizar
);

-- Primero insertamos la nueva ruta para consultar información completa del usuario
INSERT INTO rutas (id_modulo, ruta, descripcion, estado, fecha_creacion, es_publica)
VALUES 
(
    1, -- Ajusta el id_modulo según tu catálogo de módulos
    '/api/rutas',
    'Endpoint para consultar rutas',
    1, -- 1 = activo
    GETDATE(),
    0  -- 0 = no es pública, requiere autenticación
);
UPDATE [roles].[dbo].[permisos_rol]
SET 
    [id_rol] = 1,               -- Actualiza el ID del rol
    [id_ruta] = 1013,              -- Actualiza el ID de la ruta
    [puede_leer] = 1,           -- Actualiza permiso de lectura (1: Sí, 0: No)
    [puede_escribir] = 0,       -- Actualiza permiso de escritura (1: Sí, 0: No)
    [puede_eliminar] = 0,       -- Actualiza permiso de eliminación (1: Sí, 0: No)
    [estado] = 1,               -- Actualiza el estado (1: Activo, 0: Inactivo)
   -- [fecha_creacion] = GETDATE(), -- Actualiza la fecha de creación al momento actual
    [puede_actualizar] = 1      -- Actualiza permiso de actualización (1: Sí, 0: No)
WHERE 
    [id_permiso] = 1016;        -- Condición para actualizar el registro específico
