# Code Pattern Rules

> Recommended code patterns for common scenarios.

## Format

```
{scenario keywords}:
  - pattern: {pattern name}
  - description: {what to do}
  - example: {code snippet}
```

## Quantity Operations

### Adding Quantities

add, increment, increase, plus:
  - pattern: Bounds Check Before Add
  - description: Check for overflow before adding
  - example: |
      public bool Add(int amount) {
          if (amount <= 0) return false;
          if (current + amount > MAX) return false;
          current += amount;
          return true;
      }

### Subtracting Quantities

remove, subtract, decrease, minus:
  - pattern: Check Sufficiency Before Subtract
  - description: Ensure enough before subtracting
  - example: |
      public bool Remove(int amount) {
          if (amount <= 0) return false;
          if (current < amount) return false;
          current -= amount;
          return true;
      }

## Collection Operations

### Iterating Lists

iterate, loop, traverse, foreach:
  - pattern: Cache Length
  - description: Cache list length to avoid repeated property access
  - example: |
      for (int i = 0, len = list.Count; i < len; i++) {
          Process(list[i]);
      }

### Modifying During Iteration

remove, delete, modify, iterate:
  - pattern: Reverse Iteration
  - description: Iterate backwards when removing elements
  - example: |
      for (int i = list.Count - 1; i >= 0; i--) {
          if (ShouldRemove(list[i])) {
              list.RemoveAt(i);
          }
      }

## Object Lifecycle

### Frequent Creation

spawn, create, instantiate, frequent:
  - pattern: Object Pool
  - description: Reuse objects instead of creating new ones
  - example: |
      var obj = ObjectPool.Get<MyObject>();
      obj.Initialize();
      // ... use object ...
      ObjectPool.Release(obj);

### Unity Components

gameobject, prefab, instantiate:
  - pattern: Prefab Instantiation
  - description: Use prefabs, avoid new GameObject()
  - example: |
      var instance = Instantiate(prefab, parent);
      instance.transform.localPosition = Vector3.zero;

## Event Handling

### Subscribing

subscribe, listen, register, event:
  - pattern: Subscribe in OnEnable
  - description: Subscribe when enabled
  - example: |
      void OnEnable() {
          EventManager.Subscribe("Event", OnEvent);
      }

### Unsubscribing

unsubscribe, unlisten, unregister:
  - pattern: Unsubscribe in OnDisable
  - description: Always unsubscribe to prevent leaks
  - example: |
      void OnDisable() {
          EventManager.Unsubscribe("Event", OnEvent);
      }

## Async Operations

### Coroutines

coroutine, ienumerator, startcoroutine:
  - pattern: Store and Stop
  - description: Store reference and stop on disable
  - example: |
      private Coroutine _coroutine;
      
      void Start() {
          _coroutine = StartCoroutine(DoWork());
      }
      
      void OnDisable() {
          if (_coroutine != null) {
              StopCoroutine(_coroutine);
          }
      }

### Async/Await

async, await, task:
  - pattern: Cancellation Token
  - description: Support cancellation
  - example: |
      private CancellationTokenSource _cts;
      
      async void Start() {
          _cts = new CancellationTokenSource();
          await DoWorkAsync(_cts.Token);
      }
      
      void OnDisable() {
          _cts?.Cancel();
      }

---

## Adding New Patterns

1. Identify the scenario and keywords
2. Write a clear, concise pattern description
3. Include a practical code example
