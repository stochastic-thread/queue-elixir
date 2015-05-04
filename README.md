Queue
=====

```
iex -S mix
{:ok, q} = Queue.start_link([])
Queue.enqueue(q, :hello)
Queue.enqueue(q, :im)
Queue.enqueue(q, :arthur)
Queue.dequeue(q) => hello
Queue.dequeue(q) => im
Queue.dequeue(q) => arthur
```