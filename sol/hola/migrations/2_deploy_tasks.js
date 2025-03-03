const TasksContrac = artifacts.require("TasksContract");

module.exports = function (deployer) {
  deployer.deploy(TasksContrac);
};