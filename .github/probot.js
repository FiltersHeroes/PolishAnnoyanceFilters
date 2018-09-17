on('issues.opened')
  .filter(context => !context.payload.issue.body.match(/### Typ elementu/) || !context.payload.issue.body.match(/- \[[xX]]/))
  .comment(contents('.github/MISSING_ISSUE_TEMPLATE_AUTOREPLY.md'))
  .label('odrzucone');

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
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Zablokowane kliknięcie prawym przyciskiem myszy/))
  .label('prawy klik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Zablokowane kliknięcie prawym przyciskiem myszy/))
  .unlabel('prawy klik');

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
  .filter(context => context.payload.issue.body.match(/- \[[xX]] Inny widżet/))
  .label('widżet');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] Inny widżet/))
  .unlabel('widżet');
