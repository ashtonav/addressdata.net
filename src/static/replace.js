document.addEventListener('DOMContentLoaded', () => {
    function doReplacements(str) {
        return str
            // Tables -> Cities / tables -> cities
            .replace(/\bTables\b/g, 'Cities')
            .replace(/\btables\b/g, 'cities')
            .replace(/\bTable\b/g,  'City')
            .replace(/\btable\b/g,  'city')

            // Rows -> Addresses / rows -> addresses
            .replace(/\bRows\b/g,   'Addresses')
            .replace(/\brows\b/g,   'addresses')
            .replace(/\bRow\b/g,    'Address')
            .replace(/\brow\b/g,    'address');
    }

    /* ---------- 2. DOM traversal with skip logic ---------- */
    function replaceText(node) {
        if (node.nodeType === Node.TEXT_NODE) {
            node.nodeValue = doReplacements(node.nodeValue);
            return;
        }

        /* Only keep traversing if this is an element node **and**
           it is *not* one of the excluded wrappers.          */
        if (
            node.nodeType === Node.ELEMENT_NODE &&
            node.classList &&
            !node.classList.contains('table-wrapper') &&
            !node.classList.contains('leaflet-container')
        ) {
            node.childNodes.forEach(replaceText);
        }
    }

    /* ---------- 3. Apply replacements ---------- */

    /* 3a. <title> (always handled) */
    document.title = doReplacements(document.title);

    /* 3b. Content sections only */
    document
        .querySelectorAll('section.content')
        .forEach(section => replaceText(section));
});
