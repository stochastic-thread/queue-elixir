defmodule Queue do
	use GenServer

	def start_link(default) do
		GenServer.start_link(__MODULE__, default)
	end

	def enqueue(pid, item) do
		GenServer.cast(pid, {:enqueue, item})
	end

	def dequeue(pid) do
		GenServer.call(pid, :dequeue)
	end

	# Callbacks
	def handle_call(:dequeue, from, state) do
		last = List.last(state)
		{:reply, last, List.delete(state, last)}
	end

	# def handle_call(request, from, state) do
	# 	super(request, from, state)
	# end

	def handle_cast({:enqueue, item}, state) do
		{:noreply, [item|state]}
	end

	# def handle_cast(request, state) do
	# 	super(request, state)
	# end
end
