require 'rspec'
require_relative './binsearch_set'

describe BinSet do
  let(:set) { BinSet.new } # Выполняется перед каждым it

  context "Проверка работы empty и empty?: " do

    it "В начале работы множество пустое: " do
      expect(set.empty?).to be true
    end

    it "После удаления всех элементов множество должно быть пустым, а при добавлении - непустым: " do
      set.insert(1)
      expect(set.empty?).to be false
      set.empty
      expect(set.empty?).to be true
    end

  end

  context "Работа с пустым множеством: " do

    it "Проверим наличие элемента: " do
      expect(set.include?(rand(100))).to be false
    end

    it "Попробуем удалить эелемнт: " do
      expect(set.include?(rand(100))).to be false # Удалить несуществующий элемент из множества - можно
    end

  end

  context "Работа с полностью заполненным множеством: " do

    it "Попробуем добавить больше, чем возможно: " do
      (BinSet::DEF_SIZE).times do |i|
        set.insert(i)
      end
      expect{set.insert(100)}.to raise_error(RuntimeError, "BinSet is full")
    end

    it "Попробуем проверить наличие элемента и удалить его: " do
      set.insert(25)
      set.insert(68)
      expect(set.include?(68)).to be true
      expect(set.include?(75)).to be false
      expect(set.include?(25)).to be true
      expect(set.delete(68)).to eq 1
      expect(set.delete(150)).to be nil
      expect(set.delete(25)).to eq 0
    end

  end

end
