 
Parse.Cloud.afterSave(Parse.User, async (req) => {
  let user = req.object;
  // //console.log(`afterSave User with ${user.email}. Create userProfile.`);

  if (user.get('userProfile') === undefined) {
    const userProfile = new Parse.Object("UserProfile");
    userProfile.set('userName', user.get('username'));
    userProfile.set('email', user.get('email'));
    let userProfileResult = await userProfile.save(null, { useMasterKey: true });
    user.set('userProfile', userProfileResult);
    await user.save(null, { useMasterKey: true });
  }
});

Parse.Cloud.afterDelete(Parse.User, async (req) => {
  let user = req.object;
  //Apagar user de UserProfile
  //console.log(`afterDelete user ${user.id}`);
  let userProfileId = user.get('userProfile').id;
  //console.log(`deleting userProfile ${userProfileId}`);
  const userProfile = new Parse.Object("UserProfile");
  userProfile.id = userProfileId;
  await userProfile.destroy({ useMasterKey: true });
});
Parse.Cloud.define("setEmailVerification", async (request) => {
  const user = new Parse.Object("_User");
  user.id = request.params.userId;
  user.set('emailVerified', true);
  await user.save(null, { useMasterKey: true });
  return true;
});