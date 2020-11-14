# JEVE Passmaster

Un portachiavi delle password di JEVE, consente una gestione a strati dei permessi degli utenti.

È accessibile tramite una [console web](https://jeve-passmaster-flutter.web.app/) o un'applicazione [Android](https://github.com/emiliodallatorre/jeve-passmaster-flutter/releases/download/v0.0.1%2B1/app-release.apk), il cui apk si può scaricare qui.

Una versione iOS è già esistente, ma non distribuibile per ora.

## Funzionamento

In questa applicazione esistono tre "oggetti" virtuali da tenere in considerazione: i *gruppi*, le *password* e gli *utenti*.
I gruppi possono essere considerati come dei "raccoglitori" per password.
Gli "utenti", corrispondenti alle persone che usano l'app. Possono avere accesso ad uno, più di uno o tutti i *gruppi*, come spiegato di seguito.

Esistono tre tipi di utente:

- Utenti di sola lettura, possono leggere le password nei gruppi che sono stati assegnati loro
- Utenti editor, possono creare nuove password e gruppi ed assegnarli agli utenti di sola lettura
- Utenti amministratore, possono creare nuovi utenti editor e gestire tutte le password

## Come funziona?

L'applicazione / sito web è costruito con [Flutter](https://flutter.dev) e si basa sui servizi cloud Firebase, ovvero l'autenticatore ed il database, oltre che l'hosting per tenerne online la versione sito web.

In questa repository è possibile trovare il codice dell'applicazione per analizzarla più profondamente.