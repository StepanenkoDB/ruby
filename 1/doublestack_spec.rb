require 'rspec'
require './doublestack'

describe DblStack do
  before(:each) do
    @s = DblStack.new
  end

  context "Свойства методов empty? и empty:" do
    it "только что созданный контейнер является пустым" do
      @s.empty?.to be true
      @s.empty?(0).should be_true
      @s.empty?(1).should be_true
    end

    it "пустой стек с добавленным в него элементом не является пустым" do
      @s.push(0,17)
      @s.empty?(0).should be_false
      @s.push(1,18)
      @s.empty?(1).should be_false
    end

    it "после вызова метода empty стек становится пустым" do
      @s.push(0,17)
      @s.empty(0)
      @s.empty?(0).should be_true
      @s.push(1,18)
      @s.empty(1)
      @s.empty?(1).should be_true
    end
  end

  context "Особенности работы с пустым и полностью заполненным стеком:" do
    it "из пустого стека нельзя ничего извлечь" do
      expect{@s.pop(0)}.to raise_error(RuntimeError, "Stack is empty")
      expect{@s.pop(1)}.to raise_error(RuntimeError, "Stack is empty")
    end

    it "у пустого стека ничего не лежит на вершине" do
      expect{@s.top(0)}.to raise_error(RuntimeError, "Stack is empty")
      expect{@s.top(1)}.to raise_error(RuntimeError, "Stack is empty")
   end

    it "в пустой стек можно положить лишь ограниченное число элементов" do
      DblStack::DEF_SIZE.times{@s.push(0,17)}
      expect{@s.push(0,17)}.to raise_error(RuntimeError, "Stacks are full")
      @s.empty
      DblStack::DEF_SIZE.times{@s.push(1,17)}
      expect{@s.push(1,17)}.to raise_error(RuntimeError, "Stacks are full")
    end

    it "в неполностью заполненный контейнер элементы можно добавлять в любой из стеков" do
      (DblStack::DEF_SIZE - 1).times{@s.push(0,17)}
      expect{@s.push(0,17)}.to_not raise_error
      @s.empty
      (DblStack::DEF_SIZE - 1).times{@s.push(1,17)}
      expect{@s.push(0,17)}.to_not raise_error
      @s.empty
      (DblStack::DEF_SIZE - 1).times{@s.push(0,17)}
      expect{@s.push(1,17)}.to_not raise_error
      @s.empty
      (DblStack::DEF_SIZE - 1).times{@s.push(1,17)}
      expect{@s.push(1,17)}.to_not raise_error
    end
  end

  context "Особенности дисциплины обслуживания LIFO:" do
    it "первым пришёл - последним ушёл" do
      @s.push(0,17)
      @s.push(1,18)
      @s.push(0,19)
      @s.push(1,20)
      @s.top(0).should == 19
      @s.pop(0).should == 19
      @s.top(1).should == 20
      @s.pop(1).should == 20
      @s.top(0).should == 17
      @s.pop(0).should == 17
      @s.top(1).should == 18
      @s.pop(1).should == 18
    end
  end
end
