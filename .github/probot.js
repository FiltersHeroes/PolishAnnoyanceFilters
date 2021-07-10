// on('issues.opened')
//   .filter(context => !context.payload.issue.body.includes(/### Typ elementu/) || !context.payload.issue.body.includes(/- \[[xX]]/))
//   .comment(contents('.github/MISSING_ISSUE_TEMPLATE_AUTOREPLY.md'))
//   .label('odrzucone');

on('issues.labeled')
  .filter(context => context.payload.label.name === 'zatwierdzone')
  .close();

on('issues.labeled')
  .filter(context => context.payload.label.name === 'odrzucone')
  .close();

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Błąd/) && !context.payload.issue.labels.some(e => e.name === "błąd"))
  .label('błąd');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Błąd/) && context.payload.issue.labels.some(e => e.name === "błąd"))
  .unlabel('błąd');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Widżet kontaktowy\/informacji zwrotnej/) && !context.payload.issue.labels.some(e => e.name === "widżet kontaktowy/feedback"))
  .label('widżet kontaktowy/feedback');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Widżet kontaktowy\/informacji zwrotnej/) && context.payload.issue.labels.some(e => e.name === "widżet kontaktowy/feedback"))
  .unlabel('widżet kontaktowy/feedback');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Newsletter/) && !context.payload.issue.labels.some(e => e.name === "newsletter"))
  .label('newsletter');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Newsletter/) && context.payload.issue.labels.some(e => e.name === "newsletter"))
  .unlabel('newsletter');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Otagowany link wewnętrzny/) && !context.payload.issue.labels.some(e => e.name === "otagowany link wewnętrzny"))
  .label('otagowany link wewnętrzny');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Otagowany link wewnętrzny/) && context.payload.issue.labels.some(e => e.name === "otagowany link wewnętrzny"))
  .unlabel('otagowany link wewnętrzny');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Wyskakujące okienko/) && !context.payload.issue.labels.some(e => e.name === "popup"))
  .label('popup');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Wyskakujące okienko/) && context.payload.issue.labels.some(e => e.name === "popup"))
  .unlabel('popup');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Powiadomienie push/) && !context.payload.issue.labels.some(e => e.name === "push"))
  .label('push');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Powiadomienie push/) && context.payload.issue.labels.some(e => e.name === "push"))
  .unlabel('push');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Pytanie/) && !context.payload.issue.labels.some(e => e.name === "pytanie"))
  .label('pytanie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Pytanie/) && context.payload.issue.labels.some(e => e.name === "pytanie"))
  .unlabel('pytanie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Scrollujący filmik/) && !context.payload.issue.labels.some(e => e.name === "scrollujący filmik"))
  .label('scrollujący filmik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Scrollujący filmik/) && context.payload.issue.labels.some(e => e.name === "scrollujący filmik"))
  .unlabel('scrollujący filmik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Strzałka/) && !context.payload.issue.labels.some(e => e.name === "strzałka"))
  .label('strzałka');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Strzałka/) && context.payload.issue.labels.some(e => e.name === "strzałka"))
  .unlabel('strzałka');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Tło zawierające autopromocję/) && !context.payload.issue.labels.some(e => e.name === "tło autopromocyjne"))
  .label('tło autopromocyjne');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Tło zawierające autopromocję/) && context.payload.issue.labels.some(e => e.name === "tło autopromocyjne"))
  .unlabel('tło autopromocyjne');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Ulepszenie/) && !context.payload.issue.labels.some(e => e.name === "ulepszenie"))
  .label('ulepszenie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Ulepszenie/) && context.payload.issue.labels.some(e => e.name === "ulepszenie"))
  .unlabel('ulepszenie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Inny element/) && !context.payload.issue.labels.some(e => e.name === "inny element"))
  .label('inny element');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Inny element/) && context.payload.issue.labels.some(e => e.name === "inny element"))
  .unlabel('inny element');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Tytuł strony zachęcający do powrotu/) && !context.payload.issue.labels.some(e => e.name === "powrotowy tytuł"))
  .label('powrotowy tytuł');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Tytuł strony zachęcający do powrotu/) && context.payload.issue.labels.some(e => e.name === "powrotowy tytuł"))
  .unlabel('powrotowy tytuł');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Reklama prenumeraty\/e-wydania gazety/) && !context.payload.issue.labels.some(e => e.name === "prenumerata"))
  .label('prenumerata');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Reklama prenumeraty\/e-wydania gazety/) && context.payload.issue.labels.some(e => e.name === "prenumerata"))
  .unlabel('prenumerata');
