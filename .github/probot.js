on('issues.labeled')
  .filter(context => context.payload.label.name === 'zatwierdzone')
  .close();

on('issues.labeled')
  .filter(context => context.payload.label.name === 'odrzucone')
  .close();
  
on('issues.opened')
  .filter(context => !context.payload.issue.body.match(/### Typ elementu/) || context.payload.issue.body.includes('- [ ]'))
  .comment(contents('.github/MISSING_ISSUE_TEMPLATE_AUTOREPLY.md'))
  .close();

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] błąd/))
  .label('błąd');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] błąd/ && context.payload.label.name === 'błąd'))
  .unlabel('błąd');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] czat/))
  .label('czat');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[\]] czat/ && context.payload.label.name === 'czat'))
  .unlabel('czat');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] newsletter/))
  .label('newsletter');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] newsletter/ && context.payload.label.name === 'newsletter'))
  .unlabel('newsletter');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] popup/))
  .label('popup');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] popup/ && context.payload.label.name === 'popup'))
  .unlabel('popup);
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] prawy klik/))
  .label('prawy klik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] prawy klik/ && context.payload.label.name === 'prawy klik'))
  .unlabel('prawy klik');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] przycisk/))
  .label('przycisk');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] przycisk/ && context.payload.label.name === 'przycisk'))
  .unlabel('przycisk');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] push/))
  .label('push');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] push/ && context.payload.label.name === 'push'))
  .unlabel('push');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] pytanie/))
  .label('pytanie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] pytanie/ && context.payload.label.name === 'pytanie'))
  .unlabel('pytanie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] scrollujący filmik/))
  .label('scrollujący filmik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] scrollujący filmik/ && context.payload.label.name === 'scrollujący filmik'))
  .unlabel('scrollujący filmik');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] strzałka/))
  .label('strzałka');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] strzałka/ && context.payload.label.name === 'strzałka'))
  .unlabel('strzałka');  

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] ulepszenie/))
  .label('ulepszenie');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] ulepszenie/ && context.payload.label.name === 'ulepszenie'))
  .unlabel('ulepszenie');
  
on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[xX]] widżet/))
  .label('widżet');

on('issues.opened', 'issues.edited')
  .filter(context => context.payload.issue.body.match(/- \[[ ]] widżet/ && context.payload.label.name === 'widżet'))
  .unlabel('widżet');
