require 'rspec'
require_relative './triplestack_new'

describe TrplStack do
  let(:trplstack) { TrplStack.new } # Creating an object

  context "Проверяем функции empty и empty?: " do

    it "Сразу после создания: " do
      expect(trplstack.empty?).to be true
    end

    it "После добавления в первый стэк: " do
      trplstack.push(0,25)
      expect(trplstack.empty?).to be false
    end

    it "После удаления из первого стэка: " do
      trplstack.empty(0)
      expect(trplstack.empty?).to be true
    end

    it "После добавления во второй стэк: " do
      trplstack.push(1,25)
      expect(trplstack.empty?).to be false
    end

    it "После удаления во второй стэка: " do
      trplstack.empty(1)
      expect(trplstack.empty?).to be true
    end

    it "После добавления в третий стэк: " do
      trplstack.push(2,25)
      expect(trplstack.empty?).to be false
    end

    it "После удаления из третий стэка: " do
      trplstack.empty(2)
      expect(trplstack.empty?).to be true
    end

    it "После добавления в каждый и очистки двух: " do
      trplstack.push(0,rand(5))
      trplstack.push(1,rand(5))
      trplstack.push(2,rand(5))
      trplstack.empty(1)
      trplstack.empty(2)
      expect(trplstack.empty?).to be false
    end

    it "После добавления в каждый и очистки всех: " do
      trplstack.push(0,rand(5))
      trplstack.push(1,rand(5))
      trplstack.push(2,rand(5))
      trplstack.empty
      expect(trplstack.empty?).to be true
    end

  end # end of empty checkers

  context "Пустые стэки: " do

    it "Если стэк 1 пуст(удаление): " do
      expect{trplstack.pop(0)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "Если стэк 2 пуст(удаление): " do
      expect{trplstack.pop(1)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "Если стэк 3 пуст(удаление): " do
      expect{trplstack.pop(2)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "Если ввести не тот стэк(удаление): " do
      expect{trplstack.pop(rand(200)+3)}.to raise_error(RuntimeError, "Wrong stack")
    end

    it "Если стэк 1 пуст(top): " do
      expect{trplstack.top(0)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "Если стэк 2 пуст(top): " do
      expect{trplstack.top(1)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "Если стэк 3 пуст(top): " do
      expect{trplstack.top(2)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "Если ввести не тот стэк(top): " do
      expect{trplstack.top(rand(200)+3)}.to raise_error(RuntimeError, "Wrong stack")
    end

  end # end of the block with checking empty stacks

  context "Проверка полных стэков: " do

    it "Если стэк 1 заполнен: " do
      TrplStack::DEF_SIZE.times{trplstack.push(0,rand(10))}
      expect{trplstack.push(0,rand(10))}.to raise_error(RuntimeError, "Stacks are full")
    end

    it "Если стэк 2 заполнен: " do
      TrplStack::DEF_SIZE.times{trplstack.push(1,rand(10))}
      expect{trplstack.push(1,rand(10))}.to raise_error(RuntimeError, "Stacks are full")
    end

    it "Если стэк 3 заполнен: " do
      TrplStack::DEF_SIZE.times{trplstack.push(2,rand(10))}
      expect{trplstack.push(2,rand(10))}.to raise_error(RuntimeError, "Stacks are full")
    end

    it "Если комбинация стэков заполнена: " do
      trplstack.push(0,rand(10))
      3.times{trplstack.push(1,rand(10))}
      (TrplStack::DEF_SIZE-4).times{trplstack.push(2,rand(10))}
      expect{trplstack.push(0,rand(10))}.to raise_error(RuntimeError, "Stacks are full")
    end

  end # Cheking filled stacks

  context "Проверка структуры LIFO: " do

    it "Последний пришел - первый вышел: " do
      trplstack.push(0,1)
      trplstack.push(0,4)
      trplstack.push(1,10)
      trplstack.push(1,11)
      trplstack.push(2,3)
      trplstack.push(2,5)
      trplstack.push(1,12)
      expect(trplstack.pop(0)).to eq 4
      expect(trplstack.pop(2)).to eq 5
      expect(trplstack.pop(1)).to eq 12
      expect(trplstack.pop(1)).to eq 11
      expect(trplstack.pop(2)).to eq 3
      expect(trplstack.pop(1)).to eq 10
      expect(trplstack.pop(0)).to eq 1
    end

  end # Checking LIFO structure

end
