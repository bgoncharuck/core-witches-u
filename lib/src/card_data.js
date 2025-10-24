const { Ability } = require('./ability');

class CardData {
  /**
   * @param {Object} params
   * @param {number} params.id
   * @param {string} params.type
   * @param {number} params.influence
   * @param {string} params.deck
   * @param {string} params.name
   * @param {number} params.cost
   * @param {Ability} params.firstAbility
   * @param {Ability} params.secondAbility
   * @param {Ability} params.thirdAbility
   * @param {Ability} params.commonDeckAbility
   * @param {Ability} params.uncommonDeckAbility
   * @param {Ability} params.rareDeckAbility
   */
  constructor({
    id,
    type,
    influence,
    deck,
    name,
    cost,
    firstAbility,
    secondAbility,
    thirdAbility,
    commonDeckAbility,
    uncommonDeckAbility,
    rareDeckAbility,
  }) {
    this.id = id;
    this.type = type;
    this.influence = influence;
    this.deck = deck;
    this.name = name;
    this.cost = cost;
    this.firstAbility = firstAbility;
    this.secondAbility = secondAbility;
    this.thirdAbility = thirdAbility;
    this.commonDeckAbility = commonDeckAbility;
    this.uncommonDeckAbility = uncommonDeckAbility;
    this.rareDeckAbility = rareDeckAbility;
  }

  /**
   * @param {Object} json
   * @returns {CardData}
   */
  static fromJson(json) {
    return new CardData({
      id: json.id,
      type: json.type,
      influence: json.influence,
      deck: json.deck,
      name: json.name,
      cost: json.cost,
      firstAbility: Ability.fromJson(json.firstAbility),
      secondAbility: Ability.fromJson(json.secondAbility),
      thirdAbility: Ability.fromJson(json.thirdAbility),
      commonDeckAbility: Ability.fromJson(json.commonDeckAbility),
      uncommonDeckAbility: Ability.fromJson(json.uncommonDeckAbility),
      rareDeckAbility: Ability.fromJson(json.rareDeckAbility),
    });
  }

  /**
   * @param {string} jsonString
   * @returns {CardData}
   */
  static fromJsonString(jsonString) {
    const jsonObj = JSON.parse(jsonString);
    return CardData.fromJson(jsonObj);
  }

  /**
   * @returns {Object}
   */
  toJson() {
    return {
      id: this.id,
      type: this.type,
      influence: this.influence,
      deck: this.deck,
      name: this.name,
      cost: this.cost,
      firstAbility: this.firstAbility.toJson(),
      secondAbility: this.secondAbility.toJson(),
      thirdAbility: this.thirdAbility.toJson(),
      commonDeckAbility: this.commonDeckAbility.toJson(),
      uncommonDeckAbility: this.uncommonDeckAbility.toJson(),
      rareDeckAbility: this.rareDeckAbility.toJson(),
    };
  }

  /**
   * @returns {string}
   */
  toJsonString() {
    return JSON.stringify(this.toJson());
  }
}

module.exports = { CardData };