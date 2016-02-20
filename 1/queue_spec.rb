require 'rspec'
require_relative './queue'

describe Queue do
  let(:queue) { Queue.new } # Creating an object

  context "Properties of empty: and empty? methods" do
    it "queue is empty after creating" do
      expect(queue.empty?).to be true
    end

    it "With added elem it's not empty" do
      queue.enqueue(25)
      expect(queue.empty?).to be false
      expect(queue.size).to be == 1
    end

    it "After the cleaning it would be free" do
      queue.enqueue(25)
      queue.empty
      expect(queue.empty?).to be true
    end
  end

  context "Checking when queue is full or empty: " do
    it "We can't look front if there is nothing to dequeue: " do
      queue.empty
      expect{queue.front}.to raise_error(RuntimeError, "Queue is empty")
    end

    it "We can't dequeue if there is nothing to dequeue: " do
      queue.empty
      expect{queue.dequeue}.to raise_error(RuntimeError, "Queue is empty")
    end

    it "Because of ended size of queue we can enqueue only a few elements - #{Queue::DEF_SIZE}" do
      Queue::DEF_SIZE.times{queue.enqueue(rand(10))}
      expect{queue.enqueue(rand(10))}.to raise_error(RuntimeError, "Queue is full")
    end
  end

  context "Testing FIFO structure" do
    it "First in - firts out" do
      queue.enqueue(25)
      queue.enqueue(35)
      expect(queue.front).to eq 25
      expect(queue.dequeue).to eq 25
      expect(queue.front).to eq 35
      expect(queue.dequeue).to eq 35
    end
  end

end
