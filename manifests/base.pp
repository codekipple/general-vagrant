/*
    Relying on import even though its deprecated because as of yet vagrant does not support pointing to a folder of manifest files. Once it does we can stop using imports.

    https://docs.puppetlabs.com/puppet/3.5/reference/release_notes.html#auto-import-use-a-directory-as-main-manifest
*/
import 'nodes/*.pp'