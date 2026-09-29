# Projet Données Réparties – Distributed Shared Objects (2A S7)

Java RMI implementation of a *shared-object* system: clients hold local copies of
objects, and a central server enforces a readers/writer consistency protocol
(`lock_read`, `lock_write`, `unlock`, invalidation / reduction callbacks).

- Subject: [`SujetProjetObjDup.pdf`](SujetProjetObjDup.pdf)
- Original handout: `PDR/pod-api.tgz`
- Implementation (step 1): `PDR/etape1/` – `Server`, `Client`, `SharedObject`, `ObjectState`
  and the `Sentence` shared object with its stub
- Demos: `Irc` (chat window sharing a `Sentence`), `PlusieursIrc`, and stress tests
  `CrazyReaderIrc` / `CrazyWriterIrc`

## Running

```bash
cd PDR/etape1
javac *.java
java Irc alice        # one window per client
java Irc bob
```

`Irc` calls `Server.init()`, so the first client also starts the RMI registry and server
on port 1900 (`java Server` can be used to start it on its own).

An earlier draft of the same code, plus socket-based load-balancer exercises, lives in
[`../Intergiciels`](../Intergiciels).
