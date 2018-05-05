module.exports = {
    // parser: 'sugarss',
    plugins: {
        'postcss-import': {},
        'postcss-cssnext': {
            features: {
                customProperties: {
                    strict: false,
                    warnings: false,
                    appendVariables: true,
                    preserve: true
                },
                rem: false
            }

        }
    }
};