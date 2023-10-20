class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def add_two_numbers(l1, l2)
  head = ListNode.new
  curr = head
  carry_over = 0
  while l1 || l2 || carry_over.positive?
    val1 = l1&.val || 0
    val2 = l2&.val || 0
    carry_over, digit = (val1 + val2 + carry_over).divmod(10)
    curr.next = ListNode.new(digit)
    curr = curr.next
    l1 = l1&.next
    l2 = l2&.next
  end
  head.next
end

list_one = ListNode.new(2, ListNode.new(4, ListNode.new(3)))
list_two = ListNode.new(5, ListNode.new(6, ListNode.new(4)))
p add_two_numbers(list_one, list_two)
