// ability.js

class Ability {
  /**
   * @param {Object} params
   * @param {number} params.id
   * @param {string} params.type
   * @param {string} params.name
   * @param {number} [params.value]
   */
  constructor({ id, type, name, value = 0 }) {
    this.id = id;
    this.type = type;
    this.name = name;
    this.value = value;
  }

  /**
   * @param {Object} json
   * @returns {Ability}
   */
  static fromJson(json) {
    return new Ability({
      id: json.id,
      type: json.type,
      name: json.name,
      value: json.value ?? 0,
    });
  }

  /**
   * @param {string} jsonString
   * @returns {Ability}
   */
  static fromJsonString(jsonString) {
    const jsonObj = JSON.parse(jsonString);
    return Ability.fromJson(jsonObj);
  }

  /**
   * @returns {Object}
   */
  toJson() {
    return {
      id: this.id,
      type: this.type,
      name: this.name,
      value: this.value,
    };
  }

  /**
   * @returns {string}
   */
  toJsonString() {
    return JSON.stringify(this.toJson());
  }
}

module.exports = { Ability };