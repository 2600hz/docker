//window.translate = [];
( function(winkstart, amplify, $) {

    winkstart.config =  {
        /* Was winkstart.debug */
        debug: false,

        ws_server: 'wss://kamailio.kazoo:8080',

        advancedView: false,

        /* Registration Type */
        register_type: 'onboard',

        /* Do you want the signup button or not ? default to false if not set */
        hide_registration: false,

        onboard_roles: {
            'default': {
                apps: {
                    voip: {
                        label: 'Hosted PBX',
                        icon: 'phone',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    pbxs: {
                        label: 'PBX Connector',
                        icon: 'device',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    numbers: {
                        label: 'Number Manager',
                        icon: 'menu1',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    }
                },
                available_apps: ['voip', 'cluster', 'userportal', 'accounts', 'developer', 'numbers', 'pbxs'],
                default_api_url: 'http://kazoo.kazoo:8000/v1'
            },
            'reseller': {
                apps: {
                    voip: {
                        label: 'Hosted PBX',
                        icon: 'phone',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    accounts: {
                        label: 'Accounts',
                        icon: 'account',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    numbers: {
                        label: 'Number Manager',
                        icon: 'menu1',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    }
                },
                available_apps: ['voip', 'cluster', 'userportal', 'accounts', 'developer', 'numbers', 'pbxs'],
                default_api_url: 'http://kazoo.kazoo:8000/v1'
            },
            'small_office': {
                apps: {
                    voip: {
                        label: 'Hosted PBX',
                        icon: 'phone',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    numbers: {
                        label: 'Number Manager',
                        icon: 'menu1',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    }
                },
                available_apps: ['voip', 'cluster', 'userportal', 'accounts', 'developer', 'numbers', 'pbxs'],
                default_api_url: 'http://kazoo.kazoo:8000/v1'
            },
            'single_phone': {
                apps: {
                    voip: {
                        label: 'Hosted PBX',
                        icon: 'phone',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    numbers: {
                        label: 'Number Manager',
                        icon: 'menu1',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    }
                },
                available_apps: ['voip', 'cluster', 'userportal', 'accounts', 'developer', 'numbers', 'pbxs'],
                default_api_url: 'http://kazoo.kazoo:8000/v1'
            },
            'api_developer': {
                apps: {
                    developer: {
                        label: 'Developer Tool',
                        icon: 'connectivity',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    numbers: {
                        label: 'Number Manager',
                        icon: 'menu1',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    }
                },
                available_apps: ['voip', 'cluster', 'userportal', 'accounts', 'developer', 'numbers', 'pbxs'],
                default_api_url: 'http://kazoo.kazoo:8000/v1'
            },
            'voip_minutes': {
                apps: {
                    pbxs: {
                        label: 'PBX Connector',
                        icon: 'device',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    },
                    numbers: {
                        label: 'Number Manager',
                        icon: 'menu1',
                        api_url: 'http://kazoo.kazoo:8000/v1'
                    }
                },
                available_apps: ['voip', 'cluster', 'userportal', 'accounts', 'developer', 'numbers', 'pbxs'],
                default_api_url: 'http://kazoo.kazoo:8000/v1'
            }
        },

        device_threshold: [5, 20, 50, 100],

        /* web server used by the cdr module to show the link to the logs */
        logs_web_server_url: 'http://cdrs.2600hz.com/',

        /* Customized name displayed in the application (login page, resource module..) */
        company_name: '2600hz',

        base_urls: {
            'u.2600hz.com': {
                /* If this was set to true, Winkstart would look for u_2600hz_com.png in config/images/logos */
                custom_logo: false
            },
            'apps.2600hz.com': {
                custom_logo: false
            }
        },

        /* Was winkstart.realm_suffix */
        realm_suffix: {
            login: '.sip.2600hz.com',
            register: '.trial.2600hz.com'
        },

        /* What applications is available for a user that just registered */
        register_apps: {
            cluster: {
               label: 'Cluster Manager',
               icon: 'cluster_manager',
               api_url: 'http://kazoo.kazoo:8000/v1'
            },
            voip: {
                label: 'Trial PBX',
                icon: 'phone',
                api_url: 'http://kazoo.kazoo:8000/v1'
            },
            accounts: {
                label: 'Accounts',
                icon: 'account',
                api_url: 'http://kazoo.kazoo:8000/v1'
            }
        },

        /* Custom links */
        nav: {
            help: 'http://wiki.2600hz.com',
            learn_more: 'http://www.2600hz.com/'
        },

        default_api_url: 'http://kazoo.kazoo:8000/v1',
        default_api_v2_url: 'http://kazoo.kazoo:8000/v2',

        available_apps: {
            'voip': {
                id: 'voip',
                label: _t('config', 'voip_label'),
                icon: 'device',
                desc: _t('config', 'voip_desc')
            },
            'cluster': {
                id: 'cluster',
                label: _t('config', 'cluster_label'),
                icon: 'cluster_manager',
                desc: _t('config', 'cluster_desc')
            },
            'userportal': {
                id: 'userportal',
                label: _t('config', 'userportal_label'),
                icon: 'user',
                desc: _t('config', 'userportal_desc')
            },
            'accounts': {
                id: 'accounts',
                label: _t('config', 'accounts_label'),
                icon: 'account',
                desc: _t('config', 'accounts_desc')
            },
            'developer': {
                id: 'developer',
                label: _t('config', 'developer_label'),
                icon: 'connectivity',
                desc: _t('config', 'developer_desc')
            },
            'pbxs': {
                id: 'pbxs',
                label:  _t('config', 'pbxs_label'),
                icon: 'device',
                desc: _t('config', 'pbxs_desc')
            },
            'numbers': {
                id: 'numbers',
                label:  _t('config', 'numbers_label'),
                icon: 'menu1',
                desc: _t('config', 'numbers_desc')
            },
            'browserphone': {
                id: 'browserphone',
                label: _t('config', 'browserphone_label'),
                icon: 'menu1',
                desc: _t('config', 'browserphone_desc')
            }
        }
    };

    winkstart.apps = {
        'auth' : {
            api_url: 'http://kazoo.kazoo:8000/v1'
            /* These are some settings that are set automatically. You are free to override them here.
            account_id: null,
            auth_token: null,
            user_id: null,
            realm: null
            */
        },
        'myaccount': {}
    };

    amplify.cache = false;

})(window.winkstart = window.winkstart || {}, window.amplify = window.amplify || {}, window.language, jQuery);
