# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing data
# Clear existing data

PostTag.delete_all
Post.delete_all
User.delete_all
Tag.delete_all


# Crear usuarios
5.times do |i|
    user = User.create(
      name: "Usuario #{i+1}",
      email: "usuario#{i+1}@example.com",
      password: "password"
    )
  
    # Crear publicaciones para cada usuario
    post = user.posts.create(
      title: "Publicación #{i+1} por Usuario #{i+1}",
      content: "Contenido de la publicación #{i+1} por Usuario #{i+1}",
      published_at: Time.current
    )
  
    # Crear etiquetas para cada publicación
    tag = Tag.create(name: "Etiqueta_#{i+1}")
    post.tags << tag
  end
  
  # Crear publicaciones adicionales y asociar etiquetas
  5.times do |i|
    user = User.create(
      name: "Usuario adicional #{i+1}",
      email: "usuario_adicional#{i+1}@example.com",
      password: "password"
    )
  
    post = user.posts.create(
      title: "Publicación adicional #{i+1} por Usuario adicional #{i+1}",
      content: "Contenido de la publicación adicional #{i+1} por Usuario adicional #{i+1}",
      published_at: Time.current
    )
  
    tag = Tag.create(name: "Etiqueta_adicional_#{i+1}")
    post.tags << tag
  end
  
  # Asociar etiquetas adicionales con publicaciones existentes
  existing_posts = Post.all.sample(5)
  existing_posts.each do |post|
    tag = Tag.create(name: "Etiqueta_para_publicación_existente_#{post.id}")
    post.tags << tag
  end

