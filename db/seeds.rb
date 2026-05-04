puts "Limpando banco..."
Task.destroy_all
Category.destroy_all
User.destroy_all

user = User.create!(nome: "Kaue", email: "kaue@exemplo.com", password: "senha123")

trabalho = Category.create!(nome: "Trabalho", cor: "#FF5733", user: user)

10.times do |i|
  Task.create!(
    titulo: "Minha Tarefa #{i+1}",
    descricao: "Detalhes da tarefa de teste",
    concluida: false,
    user: user,
    category: trabalho
  )
end

puts "Seed finalizado com o model Task!"