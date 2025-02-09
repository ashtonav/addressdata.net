// This adds <link rel="icon" type="image/svg+xml" href="favicon.svg"> to header
document.addEventListener('DOMContentLoaded', () => {
    const link = document.createElement('link');
    link.setAttribute('rel', 'icon');
    link.setAttribute('type', 'image/svg+xml');
    link.setAttribute('href', '/static/favicon.svg');
    document.head.appendChild(link);
});
