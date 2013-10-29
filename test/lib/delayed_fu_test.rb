$:.unshift File.join(File.dirname(__FILE__),'..')
require 'test_helper'
require 'delayed_fu'

class Job; end

class MyClass
  include DelayedFu
  def foo
  end

  def self.bar
  end
end

class DelayedFuTest < Test::Unit::TestCase
  def test_job_should_receive_enqueue_with_instance_method!
    Job.expects(:enqueue!).with("MyClass", "foo", 1, 2, 3).returns(1)
    MyClass.new.delay.foo(1, 2, 3)
  end

  def test_job_should_receive_enqueue_with_class_method!
    Job.expects(:enqueue!).with("MyClass", "class.bar", 1, 2, 3).returns(1)
    MyClass.delay.bar(1, 2, 3)
  end

  def test_missing_class_method
    assert_raise NoMethodError do
      MyClass.delay.baz
    end
  end

  def test_missing_instance_method
    assert_raise NoMethodError do
      MyClass.new.delay.baz
    end
  end
end
