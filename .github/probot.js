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
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Błąd/))
  .label('błąd');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Błąd/))
  .unlabel('błąd');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Widżet kontaktowy\/informacji zwrotnej/))
  .label('widżet kontaktowy/feedback');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Widżet kontaktowy\/informacji zwrotnej/))
  .unlabel('widżet kontaktowy/feedback');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Newsletter/))
  .label('newsletter');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Newsletter/))
  .unlabel('newsletter');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Otagowany link wewnętrzny/))
  .label('otagowany link wewnętrzny');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Otagowany link wewnętrzny/))
  .unlabel('otagowany link wewnętrzny');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Wyskakujące okienko/))
  .label('popup');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Wyskakujące okienko/))
  .unlabel('popup');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Powiadomienie push/))
  .label('push');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Powiadomienie push/))
  .unlabel('push');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Pytanie/))
  .label('pytanie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Pytanie/))
  .unlabel('pytanie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Scrollujący filmik/))
  .label('scrollujący filmik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Scrollujący filmik/))
  .unlabel('scrollujący filmik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Strzałka/))
  .label('strzałka');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Strzałka/))
  .unlabel('strzałka');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Ulepszenie/))
  .label('ulepszenie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Ulepszenie/))
  .unlabel('ulepszenie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Inny element/))
  .label('inny element');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Inny element/))
  .unlabel('inny element');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Tytuł strony zachęcający do powrotu/))
  .label('powrotowy tytuł');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Tytuł strony zachęcający do powrotu/))
  .unlabel('powrotowy tytuł');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Reklama prenumeraty\/e-wydania gazety/))
  .label('prenumerata');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Reklama prenumeraty\/e-wydania gazety/))
  .unlabel('prenumerata');
