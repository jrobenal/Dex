---
inclusion: always
---

# Sales-Specific Behaviors

## Role Adaptation

Read `System/user-profile.yaml` → `sales.role_level` to adapt depth and tone:

- **`ic`** — Focus on their own pipeline, specific deals, account relationships, personal quota. Skip team-level framing.
- **`manager`** — Balance rep performance, team pipeline health, and their own deals (player-coach). Include coaching lens on every deal discussion.
- **`leader`** — Strategic framing. Board-level narratives, GTM strategy, org health, market trends. Assume they have less time and more context.

If `role_level` is unset, default to IC behaviors.

## Pillar Inference Keywords

When creating tasks without a specified pillar, use these keyword lists:

**Pipeline Development** → prospect, prospecting, outbound, cold, cold outreach, SDR, BDR, lead, leads, ICP, ideal customer profile, sequence, cadence, territory, demand gen, sourcing, referral, event, conference, LinkedIn outreach, target account, account list, pipeline generation, top of funnel, qualified, qualification, MEDDIC, BANT, discovery

**Deal Execution** → demo, demonstration, discovery call, proposal, POC, proof of concept, pilot, RFP, RFI, contract, negotiation, negotiating, close, closing, legal, procurement, champion, exec sponsor, economic buyer, pricing, discount, commit, committed, forecasted, multi-thread, stakeholder, deal review, account plan, mutual action plan, MAP, next step

**Customer Success & Expansion** → renewal, renew, upsell, cross-sell, expansion, expand, QBR, quarterly business review, EBR, executive business review, adoption, churn, churn risk, at risk, health score, NPS, customer satisfaction, CSAT, onboarding, success plan, retention, customer health, ARR growth, net revenue retention, NRR, GRR, gross retention, logo retention

**Team & Coaching** → coaching, coach, rep performance, rep, ramp, ramping, hire, hiring, interview, onboarding, pipeline review, forecast call, team meeting, 1:1, one-on-one, role play, call review, feedback, PIP, recognition, spiff, quota attainment, OTE, compensation, headcount, capacity, team health, culture, enablement

**Revenue Strategy & Operations** → GTM, go-to-market, territory plan, territory, comp plan, compensation plan, headcount plan, board, board deck, SKO, sales kickoff, forecast, forecasting, rev ops, revenue operations, CRM, CRM hygiene, Salesforce, HubSpot, analytics, market expansion, segment, ICP refinement, partnership, channel, alliances, win rate, ASP, average selling price, sales cycle, velocity, pipeline coverage

## Sales Meeting Intelligence

For **customer and prospect meetings**, always extract:

1. **BANT signals:**
   - Budget: Is funding confirmed or indicated?
   - Authority: Was the economic buyer present or named?
   - Need: What specific pain or goal was articulated?
   - Timeline: Was a decision or go-live date mentioned?
2. **Objections raised** — what they said and how it was handled
3. **Competitive mentions** — any alternative being evaluated, how we compared
4. **Deal momentum** — positive signals (urgency, exec engagement) or negative (delays, scope creep, ghosting)
5. **Agreed next step** — date, owner, action. **Explicitly flag if no next step was set.**
6. **Stakeholder role** — champion, blocker, economic buyer, influencer, technical evaluator

For **internal sales meetings** (pipeline reviews, forecast calls, 1:1s):

1. Deals discussed and status changes
2. Coaching moments or feedback given/received
3. Forecast commitments made (commit / best case / pipeline)
4. Blockers requiring escalation
5. Rep recognition or performance flags

## Sales-Specific Person Page Fields

When creating or updating pages for **prospects and customers**, include these fields in addition to standard fields:

```markdown
## Deal Context
- **Account / Company**:
- **Deal Stage**:
- **ARR / Deal Size**:
- **Close Date (Target)**:

## BANT Status
- **Budget**: confirmed / indicated / unknown
- **Authority**: economic buyer identified? (name)
- **Need**: articulated pain or goal
- **Timeline**: decision date or urgency level

## Stakeholder Role
- [ ] Champion  [ ] Economic Buyer  [ ] Blocker  [ ] Influencer  [ ] Technical Evaluator

## Competitive Situation
- Alternatives being evaluated:
- Our differentiation as they've expressed it:

## Last Touch
- **Date**:
- **Medium**: call / email / meeting
- **Outcome**:

## Agreed Next Step
- **Action**:
- **Date**:
- **Owner**:
```

## Quota & Forecast Awareness

When the user mentions quota, forecast, pipeline health, or coverage:

1. Offer to summarize pipeline from `04-Projects/Deals/`
2. Categorize deals: commit / best case / pipeline
3. Flag deals with no file activity in 14+ days as **at-risk**
4. Surface deals with no agreed next step documented
5. Calculate coverage ratio if quota is set in `System/user-profile.yaml` → `sales.annual_quota`
6. For managers/leaders: roll up team pipeline and highlight reps with coverage gaps

## Sales Career Evidence Tags

Tag sales-relevant tasks and achievements with these `# Career:` labels:

- `# Career: Pipeline Generation` — prospecting, territory coverage, sourcing
- `# Career: Deal Execution` — complex cycles, multi-threading, negotiation
- `# Career: Customer Expansion` — renewal, upsell, NRR growth
- `# Career: Sales Leadership` — coaching, team building, process design
- `# Career: Strategic Selling` — exec engagement, board narratives, GTM strategy
- `# Career: Revenue Operations` — forecasting accuracy, CRM hygiene, analytics

Example: `Close Acme Q1 renewal ^task-20260315-001 # Career: Customer Expansion`

## Deal Risk Detection

When reviewing any deal context, flag:
- No activity (file changes, meeting notes) in 14+ days
- No agreed next step documented
- Economic buyer not yet identified (stage 2+)
- Competitor evaluation mentioned but no differentiation response captured
- Close date within 30 days but key BANT elements unconfirmed
- Deal size increased >25% (scope creep risk)
