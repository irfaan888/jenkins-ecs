import jenkins.model.*

url = System.env.JENKINS_URL
urlConfig = JenkinsLocationConfiguration.get()
urlConfig.setUrl(url)
urlConfig.save()


///////////////////////////

#!/usr/bin/env groovy

// import jenkins.model.Jenkins
// import com.cloudbees.plugins.credentials.domains.Domain
// import com.cloudbees.jenkins.plugins.sshcredentials.impl.BasicSSHUserPrivateKey
// import com.cloudbees.plugins.credentials.CredentialsScope

// instance = Jenkins.instance
// domain = Domain.global()
// store = instance.getExtensionList(
//   "com.cloudbees.plugins.credentials.SystemCredentialsProvider")[0].getStore()

// privateKey = new BasicSSHUserPrivateKey.DirectEntryPrivateKeySource(
//   '''
// PRIVATE_KEY_TEXT
//   '''
// )

// sshKey = new BasicSSHUserPrivateKey(
//   CredentialsScope.GLOBAL,
//   "SECRET_TEXT",
//   "PRIVATE_KEY_USERNAME",
//   privateKey,
//   "PRIVATE_KEY_PASSPHRASE",
//   "SECRET_DESCRIPTION"
// )

// store.addCredentials(domain, sshKey)