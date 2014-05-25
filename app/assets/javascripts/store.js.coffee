# http://emberjs.com/guides/models/#toc_store
# http://emberjs.com/guides/models/pushing-records-into-the-store/

#Teaser.Store = DS.Store.extend()

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
#Teaser.ApplicationAdapter = DS.ActiveModelAdapter.extend({
#  revision: 1,
#  adapter: DS.RESTAdapter.create()
#})
