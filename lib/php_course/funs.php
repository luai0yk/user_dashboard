<?php

    function sanitizePostInput(string $key): string {
        return isset($_POST[$key]) ? htmlspecialchars(strip_tags($_POST[$key])) : '';
    }

?>