on('issues.labeled')
  .filter(context => context.payload.label.name === 'zatwierdzone')
  .close();

on('issues.labeled')
  .filter(context => context.payload.label.name === 'odrzucone')
  .close();
  
on('issues.opened')
  .filter(context => !context.payload.issue.body.match(/### Typ elementu/) 
       || !context.payload.issue.body.match(/Zgłoszenie opublikowane anonimowo przez użytkownika/) || context.payload.issue.body.includes('- [ ]'))
  .comment(contents('.github/MISSING_ISSUE_TEMPLATE_AUTOREPLY.md'))
  .close();
